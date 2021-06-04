//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

var swizzled = false

public func swizzle() {
    guard !swizzled else { return }
    swizzled = true
    do {  // didMoveToSuperview
        let m1 = class_getInstanceMethod(
            UIView.self,
            #selector(UIView.didMoveToSuperview)
        )!
        let m2 = class_getInstanceMethod(
            UIView.self,
            #selector(UIView.swizzledDidMoveToSuperview)
        )!
        method_exchangeImplementations(m1, m2)
    }
    do {
        let m1 = class_getInstanceMethod(
            UIView.self,
            #selector(UIView.addSubview(_:))
        )!
        let m2 = class_getInstanceMethod(
            UIView.self,
            #selector(UIView.swizzledAddSubview)
        )!
        method_exchangeImplementations(m1, m2)
    }
}

private extension UIView {
    @objc dynamic func swizzledDidMoveToSuperview() {
        swizzledDidMoveToSuperview()
        guard let superview = superview else {
            removeAllDelayoutConstraints()
            return
        }
        constraintsToSuperview.forEach { identifier, delayoutConstraint in
            // try remove constraint with the same identifier
            removeDelayoutConstraint(by: identifier)
            let targetedConstraint = TargetedDelayoutConstraint(
                target: superview,
                constraint: delayoutConstraint
            )
            applyTargetedConstraint(targetedConstraint)
        }
        constraintsToSuperview.removeAll()
    }
    
    @objc dynamic func swizzledAddSubview(_ subview: UIView) {
        swizzledAddSubview(subview)
        handleTargetedConstraints(of: subview)
        handleTargetedSubview(subview)
    }
    
    func handleTargetedConstraints(of subview: UIView) {
        subview.targetedConstraints.forEach { identifier, targetedConstraint in
            defer {
                subview.targetedConstraints.removeValue(forKey: identifier)
            }
            guard let target = targetedConstraint.target else {
                return
            }
            
            if target === self {
                subview.applyTargetedConstraint(targetedConstraint)
                return
            }
            
            guard target.superview != nil else {
                let targetID = ObjectIdentifier(target)
                if var subviewConstraints = subviewConstraintsByTarget[targetID] {
                    subviewConstraints.append(
                        (subview, targetedConstraint.constraint)
                    )
                    subviewConstraintsByTarget[targetID] = subviewConstraints
                } else {
                    subviewConstraintsByTarget[targetID] = [
                        (subview, targetedConstraint.constraint)
                    ]
                }
                return
            }
            
            subview.applyTargetedConstraint(targetedConstraint)
        }
    }
    
    func handleTargetedSubview(_ subview: UIView) {
        let subviewID = ObjectIdentifier(subview)
        subviewConstraintsByTarget[subviewID]?.forEach { source, constraint in
            let targetedConstraint = TargetedDelayoutConstraint(
                target: subview,
                constraint: constraint
            )
            source.applyTargetedConstraint(targetedConstraint)
            subviewConstraintsByTarget.removeValue(forKey: subviewID)
        }
    }
}


extension NSObject {
    func setRuntimeObject(
        _ value: Any?,
        by key: UnsafeRawPointer
    ) {
        doInMainThread {
            objc_setAssociatedObject(
                self,
                key,
                value,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    func getRuntimeObject<T>(
        by key: UnsafeRawPointer
    ) -> T? {
        doInMainThread {
            objc_getAssociatedObject(self, key) as? T
        }
    }
}

/// Execute a block synchronously in the main thread.
func doInMainThread<T>(_ closure: () -> T) -> T {
    if Thread.current.isMainThread {
        return closure()
    } else {
        return DispatchQueue.main.sync {
            closure()
        }
    }
}
