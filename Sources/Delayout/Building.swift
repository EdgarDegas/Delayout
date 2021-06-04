//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

protocol Building {
    var asViews: [UIView] { get }
}


extension UIView: Building {
    var asViews: [UIView] {
        [self]
    }
}

extension Array: Building where Element: UIView {
    var asViews: [UIView] {
        self
    }
}

extension Optional: Building where Wrapped: UIView {
    var asViews: [UIView] {
        if case .some(let view) = self {
            return [view]
        } else {
            return [ ]
        }
    }
}
