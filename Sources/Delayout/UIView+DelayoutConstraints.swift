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
private var keySubviewConstraintsByTarget: Void?

typealias ConstraintsToSuperview = [String: DelayoutConstraint]
typealias TargetedConstraints = [String: TargetedDelayoutConstraint]
public typealias NSConstraints = [String: NSLayoutConstraint]
typealias SubviewConstraint = (source: UIView, constraint: DelayoutConstraint)

public extension UIView {
    func removeDelayoutConstraint(by identifier: String) {
        if let nsConstraint = constraintsAddedByDelayout[identifier] {
            nsConstraint.isActive = false
            constraintsAddedByDelayout.removeValue(forKey: identifier)
        }
        constraintsToSuperview.removeValue(forKey: identifier)
        targetedConstraints.removeValue(forKey: identifier)
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
        constraintsToSuperview.removeAll()
        targetedConstraints
            .filter {
                // not targetting self
                $0.value.target !== self
            }
            .forEach {
                targetedConstraints.removeValue(forKey: $0.key)
            }
    }
    
    func removeAllDelayoutConstraints() {
        constraintsAddedByDelayout.forEach {
            $0.value.isActive = false
        }
        constraintsAddedByDelayout.removeAll()
        constraintsToSuperview.removeAll()
        targetedConstraints.removeAll()
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
    var constraintsToSuperview: ConstraintsToSuperview {
        get {
            if let constraints: ConstraintsToSuperview = getRuntimeObject(
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
    
    var targetedConstraints: TargetedConstraints {
        get {
            if let constraints: TargetedConstraints = getRuntimeObject(
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
    
    var subviewConstraintsByTarget: [ObjectIdentifier: [SubviewConstraint]] {
        get {
            if let r: [ObjectIdentifier: [SubviewConstraint]] = getRuntimeObject(
                by: &keySubviewConstraintsByTarget
            ) {
                return r
            } else {
                return [:]
            }
        }
        set {
            setRuntimeObject(newValue, by: &keySubviewConstraintsByTarget)
        }
    }
}
