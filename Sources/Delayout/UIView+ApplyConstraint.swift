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
            // store the constraint for future application
            constraintsTBAToSuperview[constraint.id] = constraint
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
        to target: UIView
    ) {
        swizzle()
        let targetedConstraint = TargetedDelayoutConstraint(
            target: target, constraint: constraint
        )
        guard target != self, target != superview else {
            // if `target` is the `superview` or the view itself,
            // then it doesn't need to be in any view hierarchy.
            applyTargetedConstraint(targetedConstraint)
            return
        }
        guard target.superview != nil, self.superview != nil else {
            // if either `target` or `self` is not added to a view hierarchy,
            // cache the constraint for future application.
            targetedConstraintsTBAByID[constraint.id] = targetedConstraint
            target.viewsHavingConstraintsTBATargetingThisViewByID[constraint.id] =
                WeakView(view: self)
            return
        }
        applyTargetedConstraint(targetedConstraint)
    }
    
    func applyTargetedConstraint(
        _ targetedConstraint: TargetedDelayoutConstraint
    ) {
        guard let target = targetedConstraint.target else { return }
        let constraint = targetedConstraint.constraint
        constraintsAddedByDelayout[constraint.id] = {
            if let constraint = constraint as? HorizontalConstraint {
                return applyHorizontalConstraint(constraint, to: target)
            } else if let constraint = constraint as? VerticalConstraint {
                return applyVerticalConstraint(constraint, to: target)
            } else if let constraint = constraint as? SizeConstraint {
                return applySizeConstraint(constraint, to: target)
            } else {
                return nil  // should be impossible
            }
        }()
    }
    
    func applyConstantSizeConstraint(
        _ constraint: ConstantSizeConstraint
    ) {
        let anchor = nsAnchor(of: constraint.side)
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
        constraintsAddedByDelayout[constraint.id] = nsConstraint
    }
}

private extension UIView {
    func applyHorizontalConstraint(
        _ constraint: HorizontalConstraint,
        to view: UIView
    ) -> NSLayoutConstraint {
        let anchor = nsAnchor(of: constraint.thisSide, type: .side)
        let thatAnchor = view.nsAnchor(
            of: constraint.thatSide,
            type: constraint.anchorPoint
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
        let anchor = nsAnchor(of: constraint.thisSide, type: .side)
        let thatAnchor = view.nsAnchor(
            of: constraint.thatSide,
            type: constraint.anchorPoint
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
        let anchor = nsAnchor(of: constraint.thisSide)
        let thatAnchor = view.nsAnchor(of: constraint.thatSide)
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
