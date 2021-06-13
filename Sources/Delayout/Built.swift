//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/4.
//

import UIKit

public protocol Built {
    func addSubviews(_ subviews: [UIView])
    
    @discardableResult
    func addSubviews(@Builder _ builder: () -> [UIView]) -> Self
    
    @discardableResult
    func callAsFunction(@Builder _ builder: () -> [UIView]) -> Self
}

public extension Built where Self: UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    @discardableResult
    func addSubviews(@Builder _ builder: () -> [UIView]) -> Self {
        addSubviews(builder())
        return self
    }
    
    @discardableResult
    func callAsFunction(@Builder _ builder: () -> [UIView]) -> Self {
        addSubviews(builder)
    }
}

public extension Built where Self: UIStackView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    @discardableResult
    func addSubviews(@Builder _ builder: () -> [UIView]) -> Self {
        addSubviews(builder())
        return self
    }
    
    @discardableResult
    func callAsFunction(@Builder _ builder: () -> [UIView]) -> Self {
        addSubviews(builder)
    }
}

extension UIView: Built { }

public typealias Stack = UIStackView

public func VStack(@Builder _ builder: () -> [UIView]) -> Stack {
    let stack = Stack()
    stack.axis = .vertical
    stack.addSubviews(builder)
    return stack
}

public func HStack(@Builder _ builder: () -> [UIView]) -> Stack {
    let stack = Stack()
    stack.axis = .horizontal
    stack.addSubviews(builder)
    return stack
}
