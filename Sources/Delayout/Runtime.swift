//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

var swizzled = false

public func swizzle() {
    guard
        !swizzled,
        let m1 = class_getInstanceMethod(
            UIView.self,
            #selector(UIView.didMoveToSuperview)
        ),
        let m2 = class_getInstanceMethod(
            UIView.self,
            #selector(UIView.swizzledDidMoveToSuperview)
        )
    else {
        return
    }
    swizzled = true
    method_exchangeImplementations(m1, m2)
}

private extension UIView {
    @objc dynamic func swizzledDidMoveToSuperview() {
        swizzledDidMoveToSuperview()
    }
}


extension NSObject {
    func setRuntimeObject(
        _ value: Any,
        by key: UnsafeRawPointer
    ) {
        objc_setAssociatedObject(
            self,
            key,
            value,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }
    
    func getRuntimeObject<T>(
        by key: UnsafeRawPointer
    ) -> T? {
        objc_getAssociatedObject(self, key) as? T
    }
}
