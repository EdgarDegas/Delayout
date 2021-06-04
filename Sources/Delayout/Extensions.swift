//
//  File.swift
//
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

public var defaultPriority: UILayoutPriority = .required

public extension UIView {
    // MARK: - Horizontal
    // MARK: leading
    func leadingInset(
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .leading,
            thatSide: .leading,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setLeadingInset(
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = leadingInset(
            from: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func leadingInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .leading,
            thatSide: .leading,
            anchorType: anchorType,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setLeadingInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = leadingInset(
            from: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func leadingInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .leading,
            thatSide: .leading,
            anchorType: anchorType,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setLeadingInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = leadingInset(
            from: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    func leading(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .leading,
            thatSide: side,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setLeading(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = leading(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func leading(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .leading,
            thatSide: side,
            anchorType: anchorType,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setLeading(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = leading(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func leading(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .leading,
            thatSide: side,
            anchorType: anchorType,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setLeading(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = leading(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    // MARK: left
    func left(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .left,
            thatSide: side,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setLeft(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = left(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func left(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .left,
            thatSide: side,
            anchorType: anchorType,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setLeft(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = left(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func left(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .left,
            thatSide: side,
            anchorType: anchorType,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraint(constraint, to: view)
        return self
    }
    
    func setLeft(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = left(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    // MARK: trailing
    func trailingInset(
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .trailing,
            thatSide: .trailing,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setTrailingInset(
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = trailingInset(
            from: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func trailingInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .trailing,
            thatSide: .trailing,
            anchorType: anchorType,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setTrailingInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = trailingInset(
            from: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func trailingInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .trailing,
            thatSide: .trailing,
            anchorType: anchorType,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setTrailingInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = trailingInset(
            from: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    func trailing(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .trailing,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = trailing(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func trailing(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .trailing,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = trailing(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func trailing(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .trailing,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = trailing(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    // MARK: right
    func right(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .right,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = right(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func right(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .right,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = right(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func right(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .right,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = right(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    // MARK: center
    @discardableResult
    func centerHorizontally(
        anchoredTo anchorType: AnchorType = .margin,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: .center,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    @discardableResult
    func centerHorizontally(
        anchoredTo anchorType: AnchorType = .margin,
        plusGreaterThan constant: CGFloat = 0,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: .center,
            anchorType: anchorType,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    @discardableResult
    func centerHorizontally(
        anchoredTo anchorType: AnchorType = .margin,
        plusLessThan constant: CGFloat = 0,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: .center,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = horizontalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func horizontalCenter(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = horizontalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func horizontalCenter(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = horizontalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    // MARK: fill
    @discardableResult
    func fillHorizontally(
        anchoredTo anchorType: AnchorType = .margin,
        padding constant: CGFloat = 0,
        leadingID: String = UUID().uuidString,
        trailingID: String = UUID().uuidString,
        priority: UILayoutPriority = defaultPriority
    ) -> Self {
        let leadingConstraint = HorizontalConstraint(
            identifier: leadingID,
            thisSide: .leading,
            thatSide: .leading,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        let trailingConstraint = HorizontalConstraint(
            identifier: trailingID,
            thisSide: .trailing,
            thatSide: .trailing,
            anchorType: anchorType,
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
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .top,
            thatSide: .top,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setTopInset(
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = topInset(
            from: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func topInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .top,
            thatSide: .top,
            anchorType: anchorType,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setTopInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = topInset(
            from: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func topInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .top,
            thatSide: .top,
            anchorType: anchorType,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setTopInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = topInset(
            from: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    func top(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .top,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = top(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func top(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .top,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = top(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func top(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .top,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = top(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    // MARK: bottom
    func bottomInset(
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .bottom,
            thatSide: .bottom,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setBottomInset(
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = bottomInset(
            from: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func bottomInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .bottom,
            thatSide: .bottom,
            anchorType: anchorType,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setBottomInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = bottomInset(
            from: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func bottomInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .bottom,
            thatSide: .bottom,
            anchorType: anchorType,
            equality: .less,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    func setBottomInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = bottomInset(
            from: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    func bottom(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .bottom,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = bottom(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func bottom(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .bottom,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = bottom(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func bottom(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .bottom,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = bottom(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    // MARK: center
    @discardableResult
    func centerVertically(
        anchoredTo anchorType: AnchorType = .margin,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: .center,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    @discardableResult
    func centerVertically(
        anchoredTo anchorType: AnchorType = .margin,
        plusGreaterThan constant: CGFloat = 0,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: .center,
            anchorType: anchorType,
            equality: .greater,
            priority: priority,
            constant: constant
        )
        tryApplyingConstraintToSuperview(constraint)
        return self
    }
    
    @discardableResult
    func centerVertically(
        anchoredTo anchorType: AnchorType = .margin,
        plusLessThan constant: CGFloat = 0,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: .center,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = verticalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            identifiedBy: identifier
        )
    }
    
    func verticalCenter(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = verticalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func verticalCenter(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            identifier: identifier,
            thisSide: .center,
            thatSide: side,
            anchorType: anchorType,
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
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = verticalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            identifiedBy: identifier
        )
    }
    
    // MARK: fill
    @discardableResult
    func fillVertically(
        anchoredTo anchorType: AnchorType = .margin,
        padding constant: CGFloat = 0,
        topID: String = UUID().uuidString,
        bottomID: String = UUID().uuidString,
        priority: UILayoutPriority = defaultPriority
    ) -> Self {
        let topConstraint = VerticalConstraint(
            identifier: topID,
            thisSide: .top,
            thatSide: .top,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        let bottomConstraint = VerticalConstraint(
            identifier: bottomID,
            thisSide: .bottom,
            thatSide: .bottom,
            anchorType: anchorType,
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
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = heightToWidthRatio(ratio, plus: constant, identifiedBy: identifier)
    }
    
    func heightToWidthRatio(
        _ ratio: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = heightToWidthRatio(
            ratio,
            plusGreaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func heightToWidthRatio(
        _ ratio: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = heightToWidthRatio(
            ratio,
            plusLessThan: constant,
            identifiedBy: identifier
        )
    }
    
    // MARK: width / height
    func widthToHeightRatio(
        _ ratio: CGFloat,
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = widthToHeightRatio(
            ratio,
            plus: constant,
            identifiedBy: identifier
        )
    }
    
    func widthToHeightRatio(
        _ ratio: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = widthToHeightRatio(
            ratio,
            plusGreaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func widthToHeightRatio(
        _ ratio: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = widthToHeightRatio(
            ratio,
            plusLessThan: constant,
            identifiedBy: identifier
        )
    }
    
    // MARK: height
    func height(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat,
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        multipliedBy multiplier: CGFloat,
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = height(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plus: constant,
            identifiedBy: identifier
        )
    }
    
    func height(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        multipliedBy multiplier: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = height(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plusGreaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func height(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        multipliedBy multiplier: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = height(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plusLessThan: constant,
            identifiedBy: identifier
        )
    }
    
    func height(
        _ constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            identifier: identifier,
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
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = height(constant, identifiedBy: identifier)
    }
    
    func height(
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            identifier: identifier,
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
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = height(greaterThan: constant, identifiedBy: identifier)
    }
    
    func height(
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            identifier: identifier,
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
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = height(lessThan: constant, identifiedBy: identifier)
    }
    
    // MARK: width
    func width(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat,
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        multipliedBy multiplier: CGFloat,
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = width(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plus: constant,
            identifiedBy: identifier
        )
    }
    
    func width(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        multipliedBy multiplier: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = width(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plusGreaterThan: constant,
            identifiedBy: identifier
        )
    }
    
    func width(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = SizeConstraint(
            identifier: identifier,
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
        multipliedBy multiplier: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = width(
            to: side,
            of: view,
            multipliedBy: multiplier,
            plusLessThan: constant,
            identifiedBy: identifier
        )
    }
    
    func width(
        _ constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            identifier: identifier,
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
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = width(constant, identifiedBy: identifier)
    }
    
    func width(
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            identifier: identifier,
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
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = width(greaterThan: constant, identifiedBy: identifier)
    }
    
    func width(
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) -> Self {
        let constraint = ConstantSizeConstraint(
            identifier: identifier,
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
        priority: UILayoutPriority = defaultPriority,
        identifiedBy identifier: String = UUID().uuidString
    ) {
        _ = width(lessThan: constant, identifiedBy: identifier)
    }
    
    // MARK: dimension
    func dimension(
        _ constant: CGFloat,
        heightID: String = UUID().uuidString,
        widthID: String = UUID().uuidString,
        priority: UILayoutPriority = defaultPriority
    ) -> Self {
        setHeight(constant, priority: priority, identifiedBy: heightID)
        setWidth(constant, priority: priority, identifiedBy: widthID)
        return self
    }
    
    func setDimension(
        _ constant: CGFloat,
        heightID: String = UUID().uuidString,
        widthID: String = UUID().uuidString,
        priority: UILayoutPriority = defaultPriority
    ) {
        _ = dimension(constant, heightID: heightID, widthID: widthID, priority: priority)
    }
}
