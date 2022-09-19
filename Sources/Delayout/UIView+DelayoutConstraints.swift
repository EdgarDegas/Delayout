//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

private var keyConstraintsToSuperview: Void?
private var keyTargetedConstraints: Void?
private var keyNSConstraints: Void?
private var keyToViewsHavingConstraintsTBATargetingThisViewByID: Void?

typealias ConstraintsToSuperviewByID = [String: DelayoutConstraint]
typealias TargetedConstraintsByID = [String: TargetedDelayoutConstraint]
public typealias NSConstraints = [String: NSLayoutConstraint]
typealias SubviewConstraint = (source: UIView, constraint: DelayoutConstraint)

public extension UIView {
    func removeDelayoutConstraint(by identifier: String) {
        if let nsConstraint = constraintsAddedByDelayout[identifier] {
            nsConstraint.isActive = false
            constraintsAddedByDelayout.removeValue(forKey: identifier)
        }
        constraintsTBAToSuperview.removeValue(forKey: identifier)
        targetedConstraintsTBAByID.removeValue(forKey: identifier)
    }
    
    func doesNSAnchor<T>(
        _ anchor: NSLayoutAnchor<T>,
        of attribute: NSLayoutConstraint.Attribute,
        belongTo view: UIView
    ) -> Bool {
        switch attribute {
        case .leading:
            return anchor == view.leadingAnchor
        case .left:
            return anchor == view.leftAnchor
        case .trailing:
            return anchor == view.trailingAnchor
        case .right:
            return anchor == view.rightAnchor
        case .top:
            return anchor == view.topAnchor
        case .bottom:
            return anchor == view.bottomAnchor
        case .firstBaseline:
            return anchor == view.firstBaselineAnchor
        case .lastBaseline:
            return anchor == view.lastBaselineAnchor
        case .centerX:
            return anchor == view.centerXAnchor
        case .centerY:
            return anchor == view.centerYAnchor
        case .width:
            return anchor == view.widthAnchor
        case .height:
            return anchor == view.heightAnchor
        case .leadingMargin,
            .leftMargin,
            .topMargin,
            .bottomMargin,
            .trailingMargin,
            .rightMargin,
            .centerXWithinMargins,
            .centerYWithinMargins,
            .notAnAttribute
        :
            // we didn't use these attributes
            return false
        @unknown default:
            return false
        }
    }
    
    func removeAllButSelfTargettingDelayoutConstraints() {
        let toRemove = constraintsAddedByDelayout
            .filter {  // remove constraints related to some other view
                if let secondAnchor = $0.value.secondAnchor {
                    let secondItemIsSelf = doesNSAnchor(
                        secondAnchor,
                        of: $0.value.secondAttribute,
                        belongTo: self
                    )
                    // don't remove if the second item is `self`
                    return !secondItemIsSelf
                }
                return false
            }
        toRemove.values.forEach {
            $0.isActive = false
        }
        toRemove.keys.forEach {
            constraintsAddedByDelayout.removeValue(forKey: $0)
        }
        constraintsTBAToSuperview.removeAll()
        targetedConstraintsTBAByID
            .filter {
                // not targetting self
                $0.value.target !== self
            }
            .forEach {
                targetedConstraintsTBAByID.removeValue(forKey: $0.key)
            }
    }
    
    func removeAllDelayoutConstraints() {
        constraintsAddedByDelayout.forEach {
            $0.value.isActive = false
        }
        constraintsAddedByDelayout.removeAll()
        constraintsTBAToSuperview.removeAll()
        targetedConstraintsTBAByID.removeAll()
    }
    
    var constraintsAddedByDelayout: NSConstraints {
        get {
            if let nsConstraints: NSConstraints = getRuntimeObject(
                by: &keyNSConstraints
            ) {
                return nsConstraints
            } else {
                return [:]
            }
        }
        set {
            setRuntimeObject(newValue, by: &keyNSConstraints)
        }
    }
}

internal extension UIView {
    var constraintsTBAToSuperview: ConstraintsToSuperviewByID {
        get {
            if let constraints: ConstraintsToSuperviewByID = getRuntimeObject(
                by: &keyConstraintsToSuperview
            ) {
                return constraints
            } else {
                return [:]
            }
        }
        set {
            setRuntimeObject(newValue, by: &keyConstraintsToSuperview)
        }
    }
    
    var targetedConstraintsTBAByID: TargetedConstraintsByID {
        get {
            if let constraints: TargetedConstraintsByID = getRuntimeObject(
                by: &keyTargetedConstraints
            ) {
                return constraints
            } else {
                return [:]
            }
        }
        set {
            setRuntimeObject(newValue, by: &keyTargetedConstraints)
        }
    }
    
    var viewsHavingConstraintsTBATargetingThisViewByID: [String: WeakView] {
        get {
            if let r: [String: WeakView] = getRuntimeObject(
                by: &keyToViewsHavingConstraintsTBATargetingThisViewByID
            ) {
                return r
            } else {
                return [:]
            }
        }
        set {
            setRuntimeObject(newValue, by: &keyToViewsHavingConstraintsTBATargetingThisViewByID)
        }
    }
}
