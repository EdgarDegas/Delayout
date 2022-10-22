//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

var swizzled = false

/// Apply constraints in `constraintsTBAToSuperview` and `targetedConstraintsTBA`.
///
/// - When being added to a superview, apply constraints in `constraintsTBAToSuperview`.
/// - When adding some view as `subview`, apply the view's `targetedConstraintsTBA`.
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
}

private extension UIView {
    /// If the view is being added as another view's subview, apply `constraintsTBAToSuperview`.
    /// If the view is being removed from `superview`, remove all constraints that involves two views.
    @objc dynamic func swizzledDidMoveToSuperview() {
        swizzledDidMoveToSuperview()
        guard superview != nil else {
            removeAllButSelfTargettingDelayoutConstraints()
            return
        }
        handleConstraintsTBAToSuperview()
        handleTargetedConstraintsTBA()
        handleViewsHavingConstraintsTBATargetingThisViewByID()
    }
    
    func handleConstraintsTBAToSuperview() {
        guard let superview = superview else {
            return
        }
        constraintsTBAToSuperview.forEach { identifier, delayoutConstraint in
            // try remove constraint with the same identifier
            removeDelayoutConstraint(by: identifier)
            let targetedConstraint = TargetedDelayoutConstraint(
                target: superview,
                constraint: delayoutConstraint
            )
            applyTargetedConstraint(targetedConstraint)
        }
        constraintsTBAToSuperview.removeAll()
    }
    
    func handleTargetedConstraintsTBA() {
        targetedConstraintsTBAByID.forEach {
            id, targetedConstraint
        in
            guard let target = targetedConstraint.target else {
                // if the target has been deallocated
                targetedConstraintsTBAByID.removeValue(forKey: id)
                return
            }
            
            let apply = { [self, target] in  // keep this non-escaping
                applyTargetedConstraint(targetedConstraint)
                targetedConstraintsTBAByID.removeValue(forKey: id)
                target.viewsHavingConstraintsTBATargetingThisViewByID.removeValue(
                    forKey: id
                )
            }
            
            if target === self || target === superview {
                // if targeting self, doesn't matter if the view is in hierarchy
                apply()
                return
            }
            
            guard superview != nil, target.superview != nil else {
                // if either view is not in a view hierarchy, do nothing
                return
            }
            
            apply()
        }
    }
    
    func handleViewsHavingConstraintsTBATargetingThisViewByID() {
        viewsHavingConstraintsTBATargetingThisViewByID.forEach {
            id, sourceViewWrapper
        in
            defer {
                viewsHavingConstraintsTBATargetingThisViewByID.removeValue(forKey: id)
            }
            guard
                let sourceView = sourceViewWrapper.view,
                let constraint = sourceView.targetedConstraintsTBAByID[id],
                sourceView.superview != nil
            else {
                // guard that source view is alive, and is added to a superview
                return
            }
            sourceView.targetedConstraintsTBAByID.removeValue(forKey: id)
            sourceView.applyTargetedConstraint(constraint)
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
