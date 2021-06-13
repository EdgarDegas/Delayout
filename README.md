# Delayout

> Doc coming soon.

Finally be able to write views as we'd like to:

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

Beautifully structured view hierarchy:

<img width="487" alt="image" src="https://user-images.githubusercontent.com/12840982/121811116-e50d9c80-cc95-11eb-968c-8f50b0dd675b.png">

And what we got (detail in the example project):

<video src="https://user-images.githubusercontent.com/12840982/121810785-b93de700-cc94-11eb-8e6c-b22ab760b824.mp4"><video/>


