import XCTest
@testable import Delayout

final class DelayoutTests: XCTestCase {
    func testMemoryReleasing() {
        var view1: UIView? = UIView()
        weak var ref1: UIView!
        var view2: UIView? = UIView()
        weak var ref2: UIView!
        
        let superview = UIView()
        superview {
            view1!
                .size(20)
                .leadingInset(by: 20)
                .trailing(to: .leading, of: view2!, by: 20)
            view2!
                .size(20)
                .trailingInset(by: -20)
        }
        
        view1?.removeFromSuperview()
        view2?.removeFromSuperview()
        view1 = nil
        view2 = nil
        XCTAssertNil(ref1)
        XCTAssertNil(ref2)
    }
    
    func testConstraintAdjustment() {
        let superview = UIView()
        let view1 = UIView()
        
        superview {
            view1
                .leadingInset(by: 20, id: "id")
        }
        
        let constraint = view1.constraintsAddedByDelayout["id"]
        XCTAssertNotNil(constraint)
    }
}
