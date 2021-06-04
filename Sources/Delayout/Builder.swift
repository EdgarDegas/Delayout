//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/4.
//

import UIKit

@resultBuilder struct Builder {
    static func buildBlock(_ components: Building...) -> [UIView] {
        components.flatMap(\.asViews)
    }
    
    static func buildOptional(_ component: [Building]?) -> [UIView] {
        component?.flatMap(\.asViews) ?? []
    }
    
    static func buildEither(first component: [Building]) -> [UIView] {
        component.flatMap(\.asViews)
    }
    
    static func buildEither(second component: [Building]) -> [UIView] {
        component.flatMap(\.asViews)
    }
}
