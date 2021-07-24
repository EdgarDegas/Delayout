//
//  File.swift
//
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

/// The default priority applied by `Delayout`.
///
/// Changing this value won't effect any constraint added before.
public var defaultDelayoutConstraintPriority: UILayoutPriority = .required

public extension UIView {
    /// Fill the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    @discardableResult
    func fill(
        at anchorPoint: AnchorPoint = .side,
        padding constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority
    ) -> Self {
        let leadingConstraint = HorizontalConstraint(
            id: UUID().uuidString,
            thisSide: .leading,
            thatSide: .leading,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        let trailingConstraint = HorizontalConstraint(
            id: UUID().uuidString,
            thisSide: .trailing,
            thatSide: .trailing,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: -constant
        )
        let topConstraint = VerticalConstraint(
            id: UUID().uuidString,
            thisSide: .top,
            thatSide: .top,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        let bottomConstraint = VerticalConstraint(
            id: UUID().uuidString,
            thisSide: .bottom,
            thatSide: .bottom,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: -constant
        )
        tryApplyingConstraintToSuperview(leadingConstraint)
        tryApplyingConstraintToSuperview(trailingConstraint)
        tryApplyingConstraintToSuperview(topConstraint)
        tryApplyingConstraintToSuperview(bottomConstraint)
        return self
    }
    
    // MARK: - Horizontal
    // MARK: leading
    
    /// Set the inset from leading of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func leadingInset(
        from anchorPoint: AnchorPoint = .side,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .leading,
            thatSide: .leading,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    /// Set the inset from leading of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setLeadingInset(
        from anchorPoint: AnchorPoint = .side,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = leadingInset(
            from: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    /// Set the minimum inset from leading of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func leadingInset(
        from anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .leading,
            thatSide: .leading,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    /// Set the minimum inset from leading of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setLeadingInset(
        from anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = leadingInset(
            from: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    /// Set the maximum inset from leading of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func leadingInset(
        from anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .leading,
            thatSide: .leading,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    /// Set the maximum inset from leading of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setLeadingInset(
        from anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = leadingInset(
            from: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    /// Set a constraint between the leading side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func leading(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .leading,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    /// Set a constraint between the leading side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setLeading(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = leading(
            to: side,
            of: view,
            at: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    /// Set the minimum spacing between the leading side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func leading(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .leading,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    /// Set the minimum spacing between the leading side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setLeading(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = leading(
            to: side,
            of: view,
            at: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    /// Set the maximum spacing between the leading side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func leading(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .leading,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    /// Set the maximum spacing between the leading side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setLeading(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = leading(
            to: side,
            of: view,
            at: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: left
    /// Set a constraint spacing between the left side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func left(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .left,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    /// Set a constraint between the left side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setLeft(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = left(
            to: side,
            of: view,
            at: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    /// Set the minimum spacing between the left side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func left(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .left,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    /// Set the minimum spacing between the left side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setLeft(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = left(
            to: side,
            of: view,
            at: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    /// Set the maximum spacing between the left side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func left(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .left,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    /// Set the maximum spacing between the left side of this view and a horizontal side of another view.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setLeft(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = left(
            to: side,
            of: view,
            at: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: trailing
    /// Set the inset from trailing of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func trailingInset(
        from anchorPoint: AnchorPoint = .side,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .trailing,
            thatSide: .trailing,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    /// Set the inset from trailing of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setTrailingInset(
        from anchorPoint: AnchorPoint = .side,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = trailingInset(
            from: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    /// Set the minimum inset from trailing of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func trailingInset(
        from anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .trailing,
            thatSide: .trailing,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    /// Set the minimum inset from trailing of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setTrailingInset(
        from anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = trailingInset(
            from: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    /// Set the maximum inset from trailing of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func trailingInset(
        from anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .trailing,
            thatSide: .trailing,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    /// Set the maximum inset from trailing of the superview.
    ///
    /// - Parameters:
    ///     - anchorPoint: If the constraint should be anchored on the side or the safe area.
    ///     - priority: Defaults to `defaultDelayoutConstraintPriority`.
    ///     - id: A unique ID of the constraint. You can retrieve the actual `NSLayoutConstraint`
    ///     by `constraintsAddedByDelayout` with this ID.
    func setTrailingInset(
        from anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = trailingInset(
            from: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    func trailing(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .trailing,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setTrailing(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = trailing(
            to: side,
            of: view,
            at: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    func trailing(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .trailing,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setTrailing(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = trailing(
            to: side,
            of: view,
            at: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    func trailing(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .trailing,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setTrailing(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = trailing(
            to: side,
            of: view,
            at: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: right
    func right(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .right,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setRight(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = right(
            to: side,
            of: view,
            at: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    func right(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .right,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setRight(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = right(
            to: side,
            of: view,
            at: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    func right(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .right,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setRight(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = right(
            to: side,
            of: view,
            at: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: center
    @discardableResult
    func centerHorizontally(
        at anchorPoint: AnchorPoint = .side,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .center,
            thatSide: .center,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    @discardableResult
    func centerHorizontally(
        at anchorPoint: AnchorPoint = .side,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .center,
            thatSide: .center,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    @discardableResult
    func centerHorizontally(
        at anchorPoint: AnchorPoint = .side,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .center,
            thatSide: .center,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    
    func horizontalCenter(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .center,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func alignHorizontalCenter(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = horizontalCenter(
            to: side,
            of: view,
            at: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    func horizontalCenter(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .center,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func alignHorizontalCenter(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = horizontalCenter(
            to: side,
            of: view,
            at: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    func horizontalCenter(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
            thisSide: .center,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func alignHorizontalCenter(
        to side: HorizontalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = horizontalCenter(
            to: side,
            of: view,
            at: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: fill
    @discardableResult
    func fillHorizontally(
        at anchorPoint: AnchorPoint = .side,
        padding constant: CGFloat = 0,
        leadingID: String = UUID().uuidString,
        trailingID: String = UUID().uuidString,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority
    ) -> Self {
        let leadingConstraint = HorizontalConstraint(
            id: leadingID,
            thisSide: .leading,
            thatSide: .leading,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        let trailingConstraint = HorizontalConstraint(
            id: trailingID,
            thisSide: .trailing,
            thatSide: .trailing,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: -constant
        )
        tryApplyingConstraintToSuperview(leadingConstraint)
        tryApplyingConstraintToSuperview(trailingConstraint)
        return self
    }
    
    // MARK: - Vertical
    // MARK: top
    func topInset(
        from anchorPoint: AnchorPoint = .side,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .top,
            thatSide: .top,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setTopInset(
        from anchorPoint: AnchorPoint = .side,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = topInset(
            from: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    func topInset(
        from anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .top,
            thatSide: .top,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setTopInset(
        from anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = topInset(
            from: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    func topInset(
        from anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .top,
            thatSide: .top,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setTopInset(
        from anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = topInset(
            from: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    func top(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .top,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setTop(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = top(
            to: side,
            of: view,
            at: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    func top(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .top,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setTop(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = top(
            to: side,
            of: view,
            at: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    func top(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .top,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setTop(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = top(
            to: side,
            of: view,
            at: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: bottom
    func bottomInset(
        from anchorPoint: AnchorPoint = .side,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .bottom,
            thatSide: .bottom,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setBottomInset(
        from anchorPoint: AnchorPoint = .side,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = bottomInset(
            from: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    func bottomInset(
        from anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .bottom,
            thatSide: .bottom,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setBottomInset(
        from anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = bottomInset(
            from: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    func bottomInset(
        from anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .bottom,
            thatSide: .bottom,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setBottomInset(
        from anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = bottomInset(
            from: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    func bottom(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .bottom,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setBottom(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = bottom(
            to: side,
            of: view,
            at: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    func bottom(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .bottom,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setBottom(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = bottom(
            to: side,
            of: view,
            at: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    func bottom(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .bottom,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setBottom(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = bottom(
            to: side,
            of: view,
            at: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: center
    @discardableResult
    func centerVertically(
        at anchorPoint: AnchorPoint = .side,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .center,
            thatSide: .center,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    @discardableResult
    func centerVertically(
        at anchorPoint: AnchorPoint = .side,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .center,
            thatSide: .center,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    @discardableResult
    func centerVertically(
        at anchorPoint: AnchorPoint = .side,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .center,
            thatSide: .center,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func verticalCenter(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .center,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func alignVerticalCenter(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        by constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = verticalCenter(
            to: side,
            of: view,
            at: anchorPoint,
            by: constant,
            id: id
        )
    }
    
    func verticalCenter(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .center,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func alignVerticalCenter(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = verticalCenter(
            to: side,
            of: view,
            at: anchorPoint,
            greaterThan: constant,
            id: id
        )
    }
    
    func verticalCenter(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
            thisSide: .center,
            thatSide: side,
            anchorPoint: anchorPoint,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func alignVerticalCenter(
        to side: VerticalAnchor,
        of view: UIView,
        at anchorPoint: AnchorPoint = .side,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = verticalCenter(
            to: side,
            of: view,
            at: anchorPoint,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: fill
    @discardableResult
    func fillVertically(
        at anchorPoint: AnchorPoint = .side,
        padding constant: CGFloat = 0,
        topID: String = UUID().uuidString,
        bottomID: String = UUID().uuidString,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority
    ) -> Self {
        let topConstraint = VerticalConstraint(
            id: topID,
            thisSide: .top,
            thatSide: .top,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        let bottomConstraint = VerticalConstraint(
            id: bottomID,
            thisSide: .bottom,
            thatSide: .bottom,
            anchorPoint: anchorPoint,
            equality: .equal,
            priority: priority,
            constant: -constant
        )
        tryApplyingConstraintToSuperview(topConstraint)
        tryApplyingConstraintToSuperview(bottomConstraint)
        return self
    }
    
    // MARK: - Size
    // MARK: height / width
    func heightToWidthRatio(
        _ ratio: CGFloat,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .height,
            thatSide: .width,
            multiplier: ratio,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: self)
        return self
    }
    
    func setHeightToWidthRatio(
        _ ratio: CGFloat,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = heightToWidthRatio(ratio, plus: constant, id: id)
    }
    
    func heightToWidthRatio(
        _ ratio: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .height,
            thatSide: .width,
            multiplier: ratio,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: self)
        return self
    }
    
    func setHeightToWidthRatio(
        _ ratio: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = heightToWidthRatio(
            ratio,
            plusGreaterThan: constant,
            id: id
        )
    }
    
    func heightToWidthRatio(
        _ ratio: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .height,
            thatSide: .width,
            multiplier: ratio,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: self)
        return self
    }
    
    func setHeightToWidthRatio(
        _ ratio: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = heightToWidthRatio(
            ratio,
            plusLessThan: constant,
            id: id
        )
    }
    
    // MARK: width / height
    func widthToHeightRatio(
        _ ratio: CGFloat,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .width,
            thatSide: .height,
            multiplier: ratio,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: self)
        return self
    }
    
    func setWidthToHeightRatio(
        _ ratio: CGFloat,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = widthToHeightRatio(
            ratio,
            plus: constant,
            id: id
        )
    }
    
    func widthToHeightRatio(
        _ ratio: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .width,
            thatSide: .height,
            multiplier: ratio,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: self)
        return self
    }
    
    func setWidthToHeightRatio(
        _ ratio: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = widthToHeightRatio(
            ratio,
            plusGreaterThan: constant,
            id: id
        )
    }
    
    func widthToHeightRatio(
        _ ratio: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .width,
            thatSide: .height,
            multiplier: ratio,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: self)
        return self
    }
    
    func setWidthToHeightRatio(
        _ ratio: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = widthToHeightRatio(
            ratio,
            plusLessThan: constant,
            id: id
        )
    }
    
    // MARK: height
    func height(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .height,
            thatSide: side,
            multiplier: multiplier,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setHeight(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = height(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plus: constant,
            id: id
        )
    }
    
    func height(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .height,
            thatSide: side,
            multiplier: multiplier,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setHeight(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = height(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plusGreaterThan: constant,
            id: id
        )
    }
    
    func height(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .height,
            thatSide: side,
            multiplier: multiplier,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setHeight(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = height(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plusLessThan: constant,
            id: id
        )
    }
    
    func height(
        _ constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            id: id,
            side: .height,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        applyConstantSizeConstraint(constraint)
        return self
    }
    
    func setHeight(
        _ constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = height(constant, id: id)
    }
    
    func height(
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            id: id,
            side: .height,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        applyConstantSizeConstraint(constraint)
        return self
    }
    
    func setHeight(
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = height(greaterThan: constant, id: id)
    }
    
    func height(
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            id: id,
            side: .height,
            equality: .less,
            priority: priority,
            constant: constant
        )
        applyConstantSizeConstraint(constraint)
        return self
    }
    
    func setHeight(
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = height(lessThan: constant, id: id)
    }
    
    // MARK: width
    func width(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .height,
            thatSide: side,
            multiplier: multiplier,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setWidth(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = width(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plus: constant,
            id: id
        )
    }
    
    func width(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .height,
            thatSide: side,
            multiplier: multiplier,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setWidth(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = width(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plusGreaterThan: constant,
            id: id
        )
    }
    
    func width(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            id: id,
            thisSide: .height,
            thatSide: side,
            multiplier: multiplier,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setWidth(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat = 1,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = width(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plusLessThan: constant,
            id: id
        )
    }
    
    func width(
        _ constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            id: id,
            side: .width,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        applyConstantSizeConstraint(constraint)
        return self
    }
    
    func setWidth(
        _ constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = width(constant, id: id)
    }
    
    func width(
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            id: id,
            side: .width,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        applyConstantSizeConstraint(constraint)
        return self
    }
    
    func setWidth(
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = width(greaterThan: constant, id: id)
    }
    
    func width(
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            id: id,
            side: .width,
            equality: .less,
            priority: priority,
            constant: constant
        )
        applyConstantSizeConstraint(constraint)
        return self
    }
    
    func setWidth(
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority,
        id: String = UUID().uuidString
    ) {
        _ = width(lessThan: constant, id: id)
    }
    
    // MARK: size
    func size(
        _ constant: CGFloat,
        heightID: String = UUID().uuidString,
        widthID: String = UUID().uuidString,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority
    ) -> Self {
        setHeight(constant, priority: priority, id: heightID)
        setWidth(constant, priority: priority, id: widthID)
        return self
    }
    
    func setSize(
        _ constant: CGFloat,
        heightID: String = UUID().uuidString,
        widthID: String = UUID().uuidString,
        priority: UILayoutPriority = defaultDelayoutConstraintPriority
    ) {
        _ = size(constant, heightID: heightID, widthID: widthID, priority: priority)
    }
}
