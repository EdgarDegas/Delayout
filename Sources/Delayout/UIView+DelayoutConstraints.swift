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
typealias NSConstraints = [String: NSLayoutConstraint]
typealias SubviewConstraint = (source: UIView, constraint: DelayoutConstraint)

public extension UIView {
    func removeDelayoutConstraint(by identifier: String) {
        if let nsConstraint = nsConstraints[identifier] {
            nsConstraint.isActive = false
            nsConstraints.removeValue(forKey: identifier)
        }
        constraintsToSuperview.removeValue(forKey: identifier)
        targetedConstraints.removeValue(forKey: identifier)
    }
    
    func removeAllDelayoutConstraints() {
        nsConstraints.forEach {
            $0.value.isActive = false
        }
        nsConstraints.removeAll()
        constraintsToSuperview.removeAll()
        targetedConstraints.removeAll()
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

    var nsConstraints: NSConstraints {
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