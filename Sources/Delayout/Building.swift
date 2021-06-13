//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

public protocol Building {
    var asDelayoutViews: [UIView] { get }
}


extension UIView: Building {
    public var asDelayoutViews: [UIView] {
        [self]
    }
}

extension Array: Building where Element: UIView {
    public var asDelayoutViews: [UIView] {
        self
    }
}

extension Optional: Building where Wrapped: UIView {
    public var asDelayoutViews: [UIView] {
        if case .some(let view) = self {
            return [view]
        } else {
            return [ ]
        }
    }
}
