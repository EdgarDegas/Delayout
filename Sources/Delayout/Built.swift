//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/6/4.
//

import UIKit

protocol Built {
    func addSubviews(_ subviews: [UIView])
    
    @discardableResult
    func addSubviews(@Builder _ builder: () -> [UIView]) -> Self
    
    @discardableResult
    func callAsFunction(@Builder _ builder: () -> [UIView]) -> Self
}

extension Built {
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

extension Built where Self: UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

extension Built where Self: UIStackView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            addArrangedSubview($0)
        }
    }
}

extension UIView: Built { }
