//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

public enum Equality {
    case equal
    case less
    case greater
}

public protocol DelayoutConstraint {
    var id: String { get }
    var equality: Equality { get }
    var priority: UILayoutPriority { get }
}

public struct HorizontalConstraint: DelayoutConstraint {
    public var id: String

    public var thisSide: HorizontalAnchor
    public var thatSide: HorizontalAnchor
    public var anchorPoint: AnchorPoint
    public var equality: Equality
    public var priority: UILayoutPriority
    public var constant: CGFloat
}

public struct VerticalConstraint: DelayoutConstraint {
    public var id: String
    
    public var thisSide: VerticalAnchor
    public var thatSide: VerticalAnchor
    public var anchorPoint: AnchorPoint
    public var equality: Equality
    public var priority: UILayoutPriority
    public var constant: CGFloat
}

public struct SizeConstraint: DelayoutConstraint {
    public var id: String
    
    public var thisSide: SizeAnchor
    public var thatSide: SizeAnchor
    public var multiplier: CGFloat
    public var equality: Equality
    public var priority: UILayoutPriority
    public var constant: CGFloat
}

public struct ConstantSizeConstraint {
    public var id: String
    
    public var side: SizeAnchor
    public var equality: Equality
    public var priority: UILayoutPriority
    public var constant: CGFloat
}
