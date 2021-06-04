//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

protocol Storable {
    
}

extension Storable {
    @discardableResult
    func store<T>(as v: inout T) -> Self {
        v = self as! T
        return self
    }
}

extension UIView: Storable { }

extension NSLayoutConstraint: Storable { }
