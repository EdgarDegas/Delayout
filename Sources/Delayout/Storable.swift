//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

public protocol Storable {
    
}

extension Storable {
    @discardableResult
    public func store<T>(as v: inout T) -> Self {
        v = self as! T
        return self
    }
}

extension UIView: Storable { }
