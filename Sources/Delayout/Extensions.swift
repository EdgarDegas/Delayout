//
//  File.swift
//
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

public var defaultPriority: UILayoutPriority = .required

public extension UIView {
    @discardableResult
    func fill(
        anchoredTo anchorType: AnchorType = .margin,
        padding constant: CGFloat = 0,
        priority: UILayoutPriority = defaultPriority
    ) -> Self {
        let leadingConstraint = HorizontalConstraint(
            id: UUID().uuidString,
            thisSide: .leading,
            thatSide: .leading,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        let trailingConstraint = HorizontalConstraint(
            id: UUID().uuidString,
            thisSide: .trailing,
            thatSide: .trailing,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: -constant
        )
        let topConstraint = VerticalConstraint(
            id: UUID().uuidString,
            thisSide: .top,
            thatSide: .top,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        let bottomConstraint = VerticalConstraint(
            id: UUID().uuidString,
            thisSide: .bottom,
            thatSide: .bottom,
            anchorType: anchorType,
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
    func leadingInset(
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = leadingInset(
            from: anchorType,
            by: constant,
            id: id
        )
    }
    
    func leadingInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = leadingInset(
            from: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func leadingInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = leadingInset(
            from: anchorType,
            lessThan: constant,
            id: id
        )
    }
    
    func leading(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = leading(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            id: id
        )
    }
    
    func leading(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = leading(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func leading(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = leading(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: left
    func left(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = left(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            id: id
        )
    }
    
    func left(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = left(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func left(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = left(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: trailing
    func trailingInset(
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = trailingInset(
            from: anchorType,
            by: constant,
            id: id
        )
    }
    
    func trailingInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = trailingInset(
            from: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func trailingInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = trailingInset(
            from: anchorType,
            lessThan: constant,
            id: id
        )
    }
    
    func trailing(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = trailing(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            id: id
        )
    }
    
    func trailing(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = trailing(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func trailing(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = trailing(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: right
    func right(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = right(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            id: id
        )
    }
    
    func right(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = right(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func right(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = right(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: center
    @discardableResult
    func centerHorizontally(
        anchoredTo anchorType: AnchorType = .margin,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = horizontalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            id: id
        )
    }
    
    func horizontalCenter(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = horizontalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func horizontalCenter(
        to side: HorizontalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = HorizontalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = horizontalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            id: id
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
            id: leadingID,
            thisSide: .leading,
            thatSide: .leading,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        let trailingConstraint = HorizontalConstraint(
            id: trailingID,
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
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = topInset(
            from: anchorType,
            by: constant,
            id: id
        )
    }
    
    func topInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = topInset(
            from: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func topInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = topInset(
            from: anchorType,
            lessThan: constant,
            id: id
        )
    }
    
    func top(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = top(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            id: id
        )
    }
    
    func top(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = top(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func top(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = top(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: bottom
    func bottomInset(
        from anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = bottomInset(
            from: anchorType,
            by: constant,
            id: id
        )
    }
    
    func bottomInset(
        from anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = bottomInset(
            from: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func bottomInset(
        from anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = bottomInset(
            from: anchorType,
            lessThan: constant,
            id: id
        )
    }
    
    func bottom(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        by constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = bottom(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            id: id
        )
    }
    
    func bottom(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = bottom(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func bottom(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = bottom(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            id: id
        )
    }
    
    // MARK: center
    @discardableResult
    func centerVertically(
        anchoredTo anchorType: AnchorType = .margin,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = verticalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            by: constant,
            id: id
        )
    }
    
    func verticalCenter(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = verticalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            greaterThan: constant,
            id: id
        )
    }
    
    func verticalCenter(
        to side: VerticalAnchor,
        of view: UIView,
        anchoredTo anchorType: AnchorType = .margin,
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) -> Self {
        let constraint = VerticalConstraint(
            id: id,
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
        id: String = UUID().uuidString
    ) {
        _ = verticalCenter(
            to: side,
            of: view,
            anchoredTo: anchorType,
            lessThan: constant,
            id: id
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
            id: topID,
            thisSide: .top,
            thatSide: .top,
            anchorType: anchorType,
            equality: .equal,
            priority: priority,
            constant: constant
        )
        let bottomConstraint = VerticalConstraint(
            id: bottomID,
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
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) {
        _ = heightToWidthRatio(ratio, plus: constant, id: id)
    }
    
    func heightToWidthRatio(
        _ ratio: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
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
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) {
        _ = height(constant, id: id)
    }
    
    func height(
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) {
        _ = height(greaterThan: constant, id: id)
    }
    
    func height(
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) {
        _ = height(lessThan: constant, id: id)
    }
    
    // MARK: width
    func width(
        to side: SizeAnchor,
        of view: UIView,
        multipliedBy multiplier: CGFloat,
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plus constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plusGreaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        multipliedBy multiplier: CGFloat,
        plusLessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) {
        _ = width(constant, id: id)
    }
    
    func width(
        greaterThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) {
        _ = width(greaterThan: constant, id: id)
    }
    
    func width(
        lessThan constant: CGFloat,
        priority: UILayoutPriority = defaultPriority,
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
        priority: UILayoutPriority = defaultPriority,
        id: String = UUID().uuidString
    ) {
        _ = width(lessThan: constant, id: id)
    }
    
    // MARK: dimension
    func dimension(
        _ constant: CGFloat,
        heightID: String = UUID().uuidString,
        widthID: String = UUID().uuidString,
        priority: UILayoutPriority = defaultPriority
    ) -> Self {
        setHeight(constant, priority: priority, id: heightID)
        setWidth(constant, priority: priority, id: widthID)
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
