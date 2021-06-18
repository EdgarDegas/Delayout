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
            view.anchor(of: .leading, type: .margin) ===
                view.leadingAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .leading, type: .safeArea) ===
                view.safeAreaLayoutGuide.leadingAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: .left, type: .margin) ===
                view.leftAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .left, type: .safeArea) ===
                view.safeAreaLayoutGuide.leftAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: .trailing, type: .margin) ===
                view.trailingAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .trailing, type: .safeArea) ===
                view.safeAreaLayoutGuide.trailingAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: .right, type: .margin) ===
                view.rightAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .right, type: .safeArea) ===
                view.safeAreaLayoutGuide.rightAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: HorizontalAnchor.center, type: .margin) ===
                view.centerXAnchor
        )
        XCTAssertTrue(
            view.anchor(of: HorizontalAnchor.center, type: .safeArea) ===
                view.safeAreaLayoutGuide.centerXAnchor
        )
    }
    
    func testBuildingVerticalAnchors() {
        XCTAssertTrue(
            view.anchor(of: .top, type: .margin) ===
                view.topAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .top, type: .safeArea) ===
                view.safeAreaLayoutGuide.topAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: .bottom, type: .margin) ===
                view.bottomAnchor
        )
        XCTAssertTrue(
            view.anchor(of: .bottom, type: .safeArea) ===
                view.safeAreaLayoutGuide.bottomAnchor
        )
        
        XCTAssertTrue(
            view.anchor(of: VerticalAnchor.center, type: .margin) ===
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
