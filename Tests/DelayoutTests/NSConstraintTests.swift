//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/18.
//


import XCTest
@testable import Delayout

final class NSConstraintTests: XCTestCase {
    /// Test if the horizontal constraints can be built correctly.
    ///
    /// Anchor correction has been verifed in `AnchorTests`.
    func testBuildingLeadingConstraint() {
        let constraint = HorizontalConstraint(
            id: "id",
            thisSide: .leading,
            thatSide: .leading,
            anchorType: .margin,
            equality: .less,
            priority: .init(999),
            constant: 99
        )

        let superview = UIView()
        let this = UIView()
        let that = UIView()
        
        superview {
            this
            that
        }
        
        this.applyTargetedConstraint(
            TargetedDelayoutConstraint(
                target: that,
                constraint: constraint
            )
        )
        
        let nsConstraint = this.constraintsAddedByDelayout["id"]
        XCTAssertNotNil(nsConstraint)
        XCTAssert(nsConstraint?.firstItem === this)
        XCTAssert(nsConstraint?.firstAnchor === this.leadingAnchor)
        XCTAssert(nsConstraint?.firstAttribute == .leading)
        
        XCTAssert(nsConstraint?.relation == .lessThanOrEqual)
        
        XCTAssert(nsConstraint?.secondItem === that)
        XCTAssert(nsConstraint?.secondAnchor === that.leadingAnchor)
        XCTAssert(nsConstraint?.secondAttribute == .leading)
        
        XCTAssert(nsConstraint?.priority.rawValue == 999)
        XCTAssert(nsConstraint?.constant == 99)
    }
    
    /// Test if the vertical constraints can be built correctly.
    ///
    /// Anchor correction has been verifed in `AnchorTests`.
    func testBuildingTopConstraint() {
        let constraint = VerticalConstraint(
            id: "id",
            thisSide: .top,
            thatSide: .top,
            anchorType: .margin,
            equality: .less,
            priority: .init(999),
            constant: 99
        )

        let superview = UIView()
        let this = UIView()
        let that = UIView()
        
        superview {
            this
            that
        }
        
        this.applyTargetedConstraint(
            TargetedDelayoutConstraint(
                target: that,
                constraint: constraint
            )
        )
        
        let nsConstraint = this.constraintsAddedByDelayout["id"]
        XCTAssertNotNil(nsConstraint)
        XCTAssert(nsConstraint?.firstItem === this)
        XCTAssert(nsConstraint?.firstAnchor === this.topAnchor)
        XCTAssert(nsConstraint?.firstAttribute == .top)
        
        XCTAssert(nsConstraint?.relation == .lessThanOrEqual)
        
        XCTAssert(nsConstraint?.secondItem === that)
        XCTAssert(nsConstraint?.secondAnchor === that.topAnchor)
        XCTAssert(nsConstraint?.secondAttribute == .top)
        
        XCTAssert(nsConstraint?.priority.rawValue == 999)
        XCTAssert(nsConstraint?.constant == 99)
    }
    
    /// Test if the non-constant size constraints can be built correctly.
    ///
    /// Anchor correction has been verifed in `AnchorTests`.
    func testBuildingWidthConstraint() {
        let constraint = SizeConstraint(
            id: "id",
            thisSide: .width,
            thatSide: .width,
            multiplier: 2,
            equality: .less,
            priority: .init(999),
            constant: 99
        )

        let superview = UIView()
        let this = UIView()
        let that = UIView()
        
        superview {
            this
            that
        }
        
        this.applyTargetedConstraint(
            TargetedDelayoutConstraint(
                target: that,
                constraint: constraint
            )
        )
        
        let nsConstraint = this.constraintsAddedByDelayout["id"]
        XCTAssertNotNil(nsConstraint)
        XCTAssert(nsConstraint?.firstItem === this)
        XCTAssert(nsConstraint?.firstAnchor === this.widthAnchor)
        XCTAssert(nsConstraint?.firstAttribute == .width)
        
        XCTAssert(nsConstraint?.relation == .lessThanOrEqual)
        
        XCTAssert(nsConstraint?.secondItem === that)
        XCTAssert(nsConstraint?.secondAnchor === that.widthAnchor)
        XCTAssert(nsConstraint?.secondAttribute == .width)
        
        XCTAssert(nsConstraint?.priority.rawValue == 999)
        XCTAssert(nsConstraint?.constant == 99)
        XCTAssert(nsConstraint?.multiplier == CGFloat(2))
    }
    
    /// Test if the constant size constraints can be built correctly.
    ///
    /// Anchor correction has been verifed in `AnchorTests`.
    func testBuildingConstantWidthConstraint() {
        let constraint = ConstantSizeConstraint(
            id: "id",
            side: .width,
            equality: .less,
            priority: .init(999),
            constant: 99
        )

        let superview = UIView()
        let this = UIView()
        
        superview {
            this
        }
        
        this.applyConstantSizeConstraint(constraint)
        
        let nsConstraint = this.constraintsAddedByDelayout["id"]
        XCTAssertNotNil(nsConstraint)
        XCTAssert(nsConstraint?.firstItem === this)
        XCTAssert(nsConstraint?.firstAnchor === this.widthAnchor)
        XCTAssert(nsConstraint?.firstAttribute == .width)
        
        XCTAssert(nsConstraint?.relation == .lessThanOrEqual)
        
        XCTAssert(nsConstraint?.priority.rawValue == 999)
        XCTAssert(nsConstraint?.constant == 99)
    }
}
