//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

internal extension UIView {
    func tryApplyingConstraintToSuperview(
        _ constraint: DelayoutConstraint
    ) {
        swizzle()
        guard let superview = superview else {
            // add delayout constraint but not apply
            constraintsToSuperview[constraint.identifier] = constraint
            return
        }
        applyTargetedConstraint(
            TargetedDelayoutConstraint(
                target: superview,
                constraint: constraint
            )
        )
    }
    
    func tryApplyingConstraint(
        _ constraint: DelayoutConstraint,
        to view: UIView
    ) {
        swizzle()
        let targetedConstraint = TargetedDelayoutConstraint(
            target: view, constraint: constraint
        )
        guard view != superview else {
            applyTargetedConstraint(targetedConstraint)
            return
        }
        guard view.superview != nil else {
            targetedConstraints[constraint.identifier] = targetedConstraint
            return
        }
        applyTargetedConstraint(targetedConstraint)
    }
    
    func applyTargetedConstraint(
        _ targetedConstraint: TargetedDelayoutConstraint
    ) {
        guard let target = targetedConstraint.target else { return }
        let constraint = targetedConstraint.constraint
        constraintsAddedByDelayout[constraint.identifier] = {
            if let constraint = constraint as? HorizontalConstraint {
                return applyHorizontalConstraint(constraint, to: target)
            } else if let constraint = constraint as? VerticalConstraint {
                return applyVerticalConstraint(constraint, to: target)
            } else if let constraint = constraint as? SizeConstraint {
                return applySizeConstraint(constraint, to: target)
            } else {
                return nil  // suppose to be impossible
            }
        }()
    }
    
    func applyConstantSizeConstraint(
        _ constraint: ConstantSizeConstraint
    ) {
        let anchor = anchor(of: constraint.side)
        let nsConstraint: NSLayoutConstraint = {
            switch constraint.equality {
            case .equal:
                return anchor.constraint(
                    equalToConstant: constraint.constant
                )
            case .greater:
                return anchor.constraint(
                    greaterThanOrEqualToConstant: constraint.constant
                )
            case .less:
                return anchor.constraint(
                    lessThanOrEqualToConstant: constraint.constant
                )
            }
        }()
        nsConstraint.priority = constraint.priority
        nsConstraint.isActive = true
        constraintsAddedByDelayout[constraint.identifier] = nsConstraint
    }
}

private extension UIView {
    func applyHorizontalConstraint(
        _ constraint: HorizontalConstraint,
        to view: UIView
    ) -> NSLayoutConstraint {
        let anchor = anchor(of: constraint.thisSide, type: .margin)
        let thatAnchor = view.anchor(
            of: constraint.thatSide,
            type: constraint.anchorType
        )
        let nsConstraint: NSLayoutConstraint = {
            switch constraint.equality {
            case .equal:
                return anchor.constraint(
                    equalTo: thatAnchor,
                    constant: constraint.constant
                )
            case .less:
                return anchor.constraint(
                    lessThanOrEqualTo: thatAnchor,
                    constant: constraint.constant
                )
            case .greater:
                return anchor.constraint(
                    greaterThanOrEqualTo: thatAnchor,
                    constant: constraint.constant
                )
            }
        }()
        nsConstraint.priority = constraint.priority
        nsConstraint.isActive = true
        return nsConstraint
    }
    
    func applyVerticalConstraint(
        _ constraint: VerticalConstraint,
        to view: UIView
    ) -> NSLayoutConstraint {
        let anchor = anchor(of: constraint.thisSide, type: .margin)
        let thatAnchor = view.anchor(
            of: constraint.thatSide,
            type: constraint.anchorType
        )
        let nsConstraint: NSLayoutConstraint = {
            switch constraint.equality {
            case .equal:
                return anchor.constraint(
                    equalTo: thatAnchor,
                    constant: constraint.constant
                )
            case .greater:
                return anchor.constraint(
                    greaterThanOrEqualTo: thatAnchor,
                    constant: constraint.constant
                )
            case .less:
                return anchor.constraint(
                    lessThanOrEqualTo: thatAnchor,
                    constant: constraint.constant
                )
            }
        }()
        nsConstraint.priority = constraint.priority
        nsConstraint.isActive = true
        return nsConstraint
    }
    
    func applySizeConstraint(
        _ constraint: SizeConstraint,
        to view: UIView
    ) -> NSLayoutConstraint {
        let anchor = anchor(of: constraint.thisSide)
        let thatAnchor = view.anchor(of: constraint.thatSide)
        let nsConstraint: NSLayoutConstraint = {
            switch constraint.equality {
            case .equal:
                return anchor.constraint(
                    equalTo: thatAnchor,
                    multiplier: constraint.multiplier,
                    constant: constraint.constant
                )
            case .greater:
                return anchor.constraint(
                    greaterThanOrEqualTo: thatAnchor,
                    multiplier: constraint.multiplier,
                    constant: constraint.constant
                )
            case .less:
                return anchor.constraint(
                    lessThanOrEqualTo: thatAnchor,
                    multiplier: constraint.multiplier,
                    constant: constraint.constant
                )
            }
        }()
        nsConstraint.priority = constraint.priority
        nsConstraint.isActive = true
        return nsConstraint
    }
}
