//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/18.
//

import XCTest
@testable import Delayout

final class BuilderTests: XCTestCase {
    let view = UIView()
    
    func testAddingSubviews() {
        let subview1 = UIView()
        view {
            subview1
        }
        XCTAssert(view.subviews.first === subview1)
        
        let subviews = [
            UIView(),
            UIView(),
            UIView()
        ]
        
        view {
            subviews
        }
        XCTAssert(view.subviews.count == 4)
        
        let ifSubview = UIView()
        view {
            if true {
                ifSubview
            }
        }
        XCTAssert(view.subviews.last === ifSubview)
        
        let addOnlyTheLabel = [
            UIView(),
            UILabel(),
            UIView()
        ]
        view {
            addOnlyTheLabel.filter {
                $0 is UILabel
            }
        }
        XCTAssert(view.subviews.last is UILabel)
    }
    
    let stack = Stack()
    
    func testAddingArrangedSubviews() {
        let subview1 = UIView()
        stack {
            subview1
        }
        XCTAssert(stack.arrangedSubviews.first === subview1)
        
        let subviews = [
            UIView(),
            UIView(),
            UIView()
        ]
        
        stack {
            subviews
        }
        XCTAssert(stack.arrangedSubviews.count == 4)
        
        let ifSubview = UIView()
        stack {
            if true {
                ifSubview
            }
        }
        XCTAssert(stack.arrangedSubviews.last === ifSubview)
        
        let addOnlyTheLabel = [
            UIView(),
            UILabel(),
            UIView()
        ]
        stack {
            addOnlyTheLabel.filter {
                $0 is UILabel
            }
        }
        XCTAssert(stack.arrangedSubviews.last is UILabel)
    }
}
