//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/5.
//

import UIKit

enum HorizontalAnchor {
    case leading
    case trailing
    case center
}

enum VerticalAnchor {
    case top
    case bottom
    case center
}

enum SizeAnchor {
    case width
    case height
}

enum AnchorType {
    case margin
    case safeArea
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
        type: AnchorType
    ) -> NSLayoutXAxisAnchor {
        switch type {
        case .margin:
            switch anchor {
            case .leading:
                return leadingAnchor
            case .trailing:
                return trailingAnchor
            case .center:
                return centerXAnchor
            }
        case .safeArea:
            switch anchor {
            case .leading:
                return safeAreaLayoutGuide.leadingAnchor
            case .trailing:
                return safeAreaLayoutGuide.trailingAnchor
            case .center:
                return safeAreaLayoutGuide.centerXAnchor
            }
        }
    }
    
    func anchor(
        of anchor: VerticalAnchor,
        type: AnchorType
    ) -> NSLayoutYAxisAnchor {
        switch type {
        case .margin:
            switch anchor {
            case .top:
                return topAnchor
            case .bottom:
                return bottomAnchor
            case .center:
                return centerYAnchor
            }
        case .safeArea:
            switch anchor {
            case .top:
                return safeAreaLayoutGuide.topAnchor
            case .bottom:
                return safeAreaLayoutGuide.bottomAnchor
            case .center:
                return safeAreaLayoutGuide.centerYAnchor
            }
        }
    }
}
