//
//  ViewController+View.swift
//  DelayoutExample
//
//  Created by iMoe Nya on 2021/6/12.
//

import UIKit
import Delayout

extension ViewController {
  final class View: UIView {
    private weak var obscuringView: UIView!
    private weak var detailView: DetailView!
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      
      let cardView = UIView()
      
      self {
        cardView {
          HStack {
            UIImageView(image: UIImage(named: "Avatar"))
              .cornerRadius(avatarDiameter / 2)
              .size(avatarDiameter)
              .clipsToBounds(true)
              .contentMode(.scaleAspectFill)
            
            VStack {
              UILabel()
                .text("Chrysanthemum")
                .font(.preferredFont(forTextStyle: .headline))
              
              UILabel()
                .text("Also called mums or chrysanths.")
                .font(.preferredFont(forTextStyle: .callout))
            }
            .spacing(4)
          }
          .spacing(12)
          .alignment(.center)
          .leadingInset(by: 20)
          .trailingInset(lessThan: -20)
          .fillVertically(padding: 20)
        }
        .topInset(from: .safeArea, by: 16)
        .cornerRadius(12)
        .backgroundColor(.secondarySystemBackground)
        .fillHorizontally(padding: 20)
        
        UIView()
          .backgroundColor(.black.withAlphaComponent(0.2))
          .alpha(0)
          .fillHorizontally()
          .fillVertically()
          .onTap(target: self, #selector(obscuringViewTapped))
          .store(as: &obscuringView)
        
        DetailView()
          .topInset(from: .safeArea, greaterThan: 0)
          .fillHorizontally()
          .top(
            to: .bottom,
            of: self,
            by: 0,
            priority: .defaultHigh,
            id: detailViewTopConstraintID
          )
          .store(as: &detailView)
      }
      .backgroundColor(.systemBackground)
      .onTap(target: self, #selector(tapped))
    }
    
    required init?(coder: NSCoder) {
      fatalError()
    }
  }
}

private extension ViewController.View {
  final class DetailView: UIView {
    override init(frame: CGRect) {
      super.init(frame: frame)
      
      let headerImageView = UIImageView(image: UIImage(named: "Detail"))
      
      self {
        headerImageView
          .fillHorizontally()
          .height(200)
          .topInset(by: 0)
        
        VStack {
          VStack {
            UILabel()
              .font(.preferredFont(forTextStyle: .title3))
              .text("Chrysanthemums")
            
            UILabel()
              .textColor(.secondaryLabel)
              .font(.preferredFont(forTextStyle: .subheadline))
              .text("Also called mums or chrysanths.")
          }
          .spacing(4)

          UILabel()
            .numberOfLines(0)
            .font(.preferredFont(forTextStyle: .body))
            .text(
              """
              Chrysanthemums (/krɪˈsænθəməm/), are flowering plants of the genus Chrysanthemum in the family Asteraceae. They are native to East Asia and northeastern Europe. Most species originate from East Asia and the center of diversity is in China.[5] Countless horticultural varieties and cultivars exist.
              """
            )
          
          UILabel()
            .font(.preferredFont(forTextStyle: .footnote))
            .textColor(.tertiaryLabel)
            .text("From Wikipedia")
        }
        .spacing(12)
        .alignment(.leading)
        .top(to: .bottom, of: headerImageView, by: 20)
        .bottomInset(from: .safeArea, by: -20)
        .fillHorizontally(padding: 20)
      }
      .cornerRadius(24)
      .clipsToBounds(true)
      .backgroundColor(.systemBackground)
    }
    
    required init?(coder: NSCoder) {
      fatalError()
    }
  }
}


private extension ViewController.View {
  var avatarDiameter: CGFloat {
    64
  }
  
  var detailViewTopConstraintID: String {
    "detail top"
  }
  
  @objc func tapped() {
    toggleDetailViewVisible(true)
    toggleObscuringViewVisible(true)
  }
  
  @objc func obscuringViewTapped() {
    toggleDetailViewVisible(false) {
      self.toggleObscuringViewVisible(false)
    }
  }
  
  func toggleObscuringViewVisible(_ visible: Bool) {
    if let controller = self.next as? UIViewController {
      controller.navigationController?.navigationBar.layer.zPosition = {
        if visible {
          return -1
        } else {
          return 0
        }
      }()
    }
    let alpha: CGFloat = {
      if visible {
        return 1
      } else {
        return 0
      }
    }()
    
    UIView.animate(
      withDuration: 0.3,
      delay: 0,
      usingSpringWithDamping: 1,
      initialSpringVelocity: 0,
      options: []
    ) { [self] in
      obscuringView.alpha = alpha
    } completion: { _ in
      // nothing
    }
  }
  
  func toggleDetailViewVisible(_ visible: Bool, completion: (() -> Void)? = nil) {
    let constraint = detailView.constraintsAddedByDelayout[detailViewTopConstraintID]
    constraint?.constant = {
      if visible {
        return -detailView.frame.height
      } else {
        return 0
      }
    }()
    UIView.animate(
      withDuration: 0.3,
      delay: 0,
      usingSpringWithDamping: 1,
      initialSpringVelocity: 0,
      options: []
    ) { [self] in
      self.layoutIfNeeded()
    } completion: { _ in
      completion?()
    }
  }
}

