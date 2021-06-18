## Abstract

Delayout allows you to write you UI structure code together with the layout code:

```swift
let someView = SomeView()
let label = Label()

view {  // view builder provided by Delayout
    someView
        .fillHorizontally()
        .topInset(by: 20)
    label
        .top(to: .bottom, of: someView, by: 8)  // constraint to sibling
        .centerHorizontally()
        .bottomInset(by: -20)
}
```

## Without Delayout
Even though you might already had the UIKit system _DSLified_, you still have to write your UI structure code and layout code separately:
```swift
let someView = SomeView()
let label = UILabel()

view.subviews {
    someView
    label
}

// ......

someView.Top == view.Top
label.Top == someView.Bottom
```

If you try adding constraints between the view and its superview inside the `subviews { /* ... */ }` block, which I bet you had tried, it won't work. Because inside the block, the view has not yet been added to the superview then:

```swift
view.subviews {
    someView
        .fillHorizontally(padding: 20)  // won't work
}
```

Let alone setting up constraints between siblings, which leads to a runtime crash:
```swift
view.subviews {
    someView
    label
        .make { /* top to someView */ }
}
```

Delayout makes it work, in 2 steps: 
1. Delay
2. Layout

I attached an example project in the repo. A glance:

```Swift
final class View: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let cardView = UIView()
    
    self {
      cardView {
        HStack {
          UIImageView(image: UIImage(named: "Avatar"))
            .cornerRadius(avatarDimension / 2)
            .dimension(avatarDimension)
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
          identifiedBy: detailViewTopConstraintID
        )
        .store(as: &detailView)
    }
    .backgroundColor(.systemBackground)
    .onTap(target: self, #selector(tapped))
  }
}
```

And the result:

<video src="https://user-images.githubusercontent.com/12840982/121810785-b93de700-cc94-11eb-8e6c-b22ab760b824.mp4"><video/>

The animation is done by updating the constant of a constraint added by Delayout. We'll explain that later.
