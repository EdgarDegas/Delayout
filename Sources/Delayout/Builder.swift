//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/4.
//

import UIKit

@resultBuilder public struct Builder {
    public static func buildBlock(_ components: Building...) -> [UIView] {
        components.flatMap(\.asDelayoutViews)
    }
    
    public static func buildOptional(_ component: [Building]?) -> [UIView] {
        component?.flatMap(\.asDelayoutViews) ?? []
    }
    
    public static func buildEither(first component: [Building]) -> [UIView] {
        component.flatMap(\.asDelayoutViews)
    }
    
    public static func buildEither(second component: [Building]) -> [UIView] {
        component.flatMap(\.asDelayoutViews)
    }

    public static func buildArray(_ components: [[Building]]) -> [UIView] {
        components.flatMap {
            $0.flatMap {
                $0.asDelayoutViews
            }
        }
    }
}
