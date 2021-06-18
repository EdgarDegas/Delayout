//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/18.
//

import XCTest
@testable import Delayout

final class AnchorTests: XCTestCase {
    let view = UIView()
    
    func testBuildingHorizontalAnchors() {
        XCTAssertTrue(
            view.anchor(of: .leading, type: .side) ===
                view.leadingAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .leading, type: .safeArea) ===
                view.safeAreaLayoutGuide.leadingAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: .left, type: .side) ===
                view.leftAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .left, type: .safeArea) ===
                view.safeAreaLayoutGuide.leftAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: .trailing, type: .side) ===
                view.trailingAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .trailing, type: .safeArea) ===
                view.safeAreaLayoutGuide.trailingAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: .right, type: .side) ===
                view.rightAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .right, type: .safeArea) ===
                view.safeAreaLayoutGuide.rightAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: HorizontalAnchor.center, type: .side) ===
                view.centerXAnchor
        )
        XCTAssertTrue(
            view.anchor(of: HorizontalAnchor.center, type: .safeArea) ===
                view.safeAreaLayoutGuide.centerXAnchor
        )
    }
    
    func testBuildingVerticalAnchors() {
        XCTAssertTrue(
            view.anchor(of: .top, type: .side) ===
                view.topAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .top, type: .safeArea) ===
                view.safeAreaLayoutGuide.topAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: .bottom, type: .side) ===
                view.bottomAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .bottom, type: .safeArea) ===
                view.safeAreaLayoutGuide.bottomAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: VerticalAnchor.center, type: .side) ===
                view.centerYAnchor
        )
        XCTAssertTrue(
            view.anchor(of: VerticalAnchor.center, type: .safeArea) ===
                view.safeAreaLayoutGuide.centerYAnchor
        )
    }
    
    func testBuildingSizeAnchors() {
        XCTAssertTrue(
            view.anchor(of: .width) === view.widthAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .height) === view.heightAnchor
        )
    }
}
