//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

public enum HorizontalAnchor {
    case leading
    case trailing
    case left
    case right
    case center
}

public enum VerticalAnchor {
    case top
    case bottom
    case center
}

public enum SizeAnchor {
    case width
    case height
}

public enum AnchorPoint {
    case side
    case safeArea
    case layoutMargins
    case readableContent
    case custom(UILayoutGuide)
}

extension UIView {
    func anchor(of anchor: SizeAnchor) -> NSLayoutDimension {
        switch anchor {
        case .height:
            return heightAnchor
        case .width:
            return widthAnchor
        }
    }
    
    func anchor(
        of anchor: HorizontalAnchor,
        type: AnchorPoint
    ) -> NSLayoutXAxisAnchor {
        switch type {
        case .side:
            switch anchor {
            case .leading:
                return leadingAnchor
            case .trailing:
                return trailingAnchor
            case .center:
                return centerXAnchor
            case .left:
                return leftAnchor
            case .right:
                return rightAnchor
            }
        case .safeArea:
            return safeAreaLayoutGuide.anchor(of: anchor)
        case .layoutMargins:
            return layoutMarginsGuide.anchor(of: anchor)
        case .readableContent:
            return readableContentGuide.anchor(of: anchor)
        case .custom(let guide):
            return guide.anchor(of: anchor)
        }
    }
    
    func anchor(
        of anchor: VerticalAnchor,
        type: AnchorPoint
    ) -> NSLayoutYAxisAnchor {
        switch type {
        case .side:
            switch anchor {
            case .top:
                return topAnchor
            case .bottom:
                return bottomAnchor
            case .center:
                return centerYAnchor
            }
        case .safeArea:
            return safeAreaLayoutGuide.anchor(of: anchor)
        case .layoutMargins:
            return layoutMarginsGuide.anchor(of: anchor)
        case .readableContent:
            return readableContentGuide.anchor(of: anchor)
        case .custom(let guide):
            return guide.anchor(of: anchor)
        }
    }
}

extension UILayoutGuide {
    func anchor(of anchor: HorizontalAnchor) -> NSLayoutXAxisAnchor {
        switch anchor {
        case .leading:
            return leadingAnchor
        case .trailing:
            return trailingAnchor
        case .center:
            return centerXAnchor
        case .left:
            return leftAnchor
        case .right:
            return rightAnchor
        }
    }
    
    func anchor(of anchor: VerticalAnchor) -> NSLayoutYAxisAnchor {
        switch anchor {
        case .top:
            return topAnchor
        case .bottom:
            return bottomAnchor
        case .center:
            return centerYAnchor
        }
    }
    
    func anchor(of anchor: SizeAnchor) -> NSLayoutDimension {
        switch anchor {
        case .width:
            return widthAnchor
        case .height:
            return heightAnchor
        }
    }
}
