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
    
    func removeAllButSelfTargettingDelayoutConstraints() {
        let toRemove = constraintsAddedByDelayout
            .filter {
                if $0.value.secondItem == nil {
                    // if there's only one item, it must be not `self`
                    return $0.value.firstItem !== self
                }
                if $0.value.secondItem != nil {
                    // if there're 2 items, neither of them should be not `self`
                    return $0.value.firstItem !== self || $0.value.secondItem !== self
                }
                return true
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
