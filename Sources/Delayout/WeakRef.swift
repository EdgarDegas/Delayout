//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import Foundation

public struct WeakRef<T: AnyObject> {
    weak var object: T?
    
    init(object: T) {
        self.object = object
    }
}
