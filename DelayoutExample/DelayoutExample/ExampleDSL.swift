//
//  ExampleDSL.swift
//  DelayoutExample
//
//  Created by iMoe Nya on 2021/6/12.
//

import UIKit

protocol UIViewChainable {
    func backgroundColor(_ color: UIColor) -> Self
    func cornerRadius(_ radius: CGFloat) -> Self
    func clipsToBounds(_ flag: Bool) -> Self
    func contentMode(_ mode: UIView.ContentMode) -> Self
    func onTap(target: Any, _ action: Selector) -> Self
    func alpha(_ value: CGFloat) -> Self
}

extension UIViewChainable where Self: UIView {
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    func cornerRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        return self
    }
    
    func clipsToBounds(_ flag: Bool) -> Self {
        self.clipsToBounds = flag
        return self
    }
    
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        self.contentMode = mode
        return self
    }
    
    @discardableResult
    func onTap(target: Any, _ action: Selector) -> Self {
        let tapRecognizer = UITapGestureRecognizer(
            target: target, action: action
        )
        addGestureRecognizer(tapRecognizer)
        return self
    }
    
    func alpha(_ value: CGFloat) -> Self {
        self.alpha = value
        return self
    }
}

extension UIView: UIViewChainable {
    
}

protocol TextChainable {
    func text(_ text: String) -> Self
    func font(_ font: UIFont) -> Self
    func textColor(_ color: UIColor) -> Self
}

extension TextChainable where Self: UILabel {
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    func textColor(_ color: UIColor) -> Self {
        textColor = color
        return self
    }
}

extension UILabel: TextChainable {
    
}

extension UILabel {
    func numberOfLines(_ value: Int) -> Self {
        self.numberOfLines = value
        return self
    }
}

protocol StackChainable {
    func spacing(_ value: CGFloat) -> Self
    func alignment(_ rule: Stack.Alignment) -> Self
}

extension StackChainable where Self: Stack {
    func spacing(_ value: CGFloat) -> Self {
        self.spacing = value
        return self
    }
    
    func alignment(_ rule: Stack.Alignment) -> Self {
        self.alignment = rule
        return self
    }
}

extension Stack: StackChainable {
    
}
