//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/13.
//

import UIKit

struct TargetedDelayoutConstraint {
    unowned(unsafe) var target: UIView?
    var constraint: DelayoutConstraint
    
    var identifier: String {
        constraint.identifier
    }
}
