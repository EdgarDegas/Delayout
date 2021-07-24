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
            view.nsAnchor(of: .leading, type: .side) ===
                view.leadingAnchor
        )
        XCTAssertTrue(
            view.nsAnchor(of: .leading, type: .safeArea) ===
                view.safeAreaLayoutGuide.leadingAnchor
        )
        
        XCTAssertTrue(
            view.nsAnchor(of: .left, type: .side) ===
                view.leftAnchor
        )
        XCTAssertTrue(
            view.nsAnchor(of: .left, type: .safeArea) ===
                view.safeAreaLayoutGuide.leftAnchor
        )
        
        XCTAssertTrue(
            view.nsAnchor(of: .trailing, type: .side) ===
                view.trailingAnchor
        )
        XCTAssertTrue(
            view.nsAnchor(of: .trailing, type: .safeArea) ===
                view.safeAreaLayoutGuide.trailingAnchor
        )
        
        XCTAssertTrue(
            view.nsAnchor(of: .right, type: .side) ===
                view.rightAnchor
        )
        XCTAssertTrue(
            view.nsAnchor(of: .right, type: .safeArea) ===
                view.safeAreaLayoutGuide.rightAnchor
        )
        
        XCTAssertTrue(
            view.nsAnchor(of: HorizontalAnchor.center, type: .side) ===
                view.centerXAnchor
        )
        XCTAssertTrue(
            view.nsAnchor(of: HorizontalAnchor.center, type: .safeArea) ===
                view.safeAreaLayoutGuide.centerXAnchor
        )
    }
    
    func testBuildingVerticalAnchors() {
        XCTAssertTrue(
            view.nsAnchor(of: .top, type: .side) ===
                view.topAnchor
        )
        XCTAssertTrue(
            view.nsAnchor(of: .top, type: .safeArea) ===
                view.safeAreaLayoutGuide.topAnchor
        )
        
        XCTAssertTrue(
            view.nsAnchor(of: .bottom, type: .side) ===
                view.bottomAnchor
        )
        XCTAssertTrue(
            view.nsAnchor(of: .bottom, type: .safeArea) ===
                view.safeAreaLayoutGuide.bottomAnchor
        )
        
        XCTAssertTrue(
            view.nsAnchor(of: VerticalAnchor.center, type: .side) ===
                view.centerYAnchor
        )
        XCTAssertTrue(
            view.nsAnchor(of: VerticalAnchor.center, type: .safeArea) ===
                view.safeAreaLayoutGuide.centerYAnchor
        )
    }
    
    func testBuildingSizeAnchors() {
        XCTAssertTrue(
            view.nsAnchor(of: .width) === view.widthAnchor
        )
        XCTAssertTrue(
            view.nsAnchor(of: .height) === view.heightAnchor
        )
    }
}
