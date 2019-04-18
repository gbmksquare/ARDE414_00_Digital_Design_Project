import Foundation
import UIKit
import PlaygroundSupport

class ViewController: UIViewController {
    private lazy var card = UIView()
    private lazy var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2549019753932953, green: 0.27450981736183167, blue: 0.3019607961177826, alpha: 1.0)
        
        view.addSubview(card)
        card.addSubview(label)
        
        label.text = "BumMo Koo"
        // label.textColor = #colorLiteral(red: 0.7450980544090271, green: 0.1568627506494522, blue: 0.07450980693101883, alpha: 1.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.sizeToFit()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .white
        card.translatesAutoresizingMaskIntoConstraints = false
        let width: CGFloat = 320
        NSLayoutConstraint.activate([
            card.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier:  1),
            card.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            card.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5),
            card.heightAnchor.constraint(equalTo: card.widthAnchor, multiplier: 5/9),
            // Label
            label.centerXAnchor.constraint(equalToSystemSpacingAfter: card.centerXAnchor, multiplier:  1),
            label.centerYAnchor.constraint(equalToSystemSpacingBelow: card.centerYAnchor, multiplier: 1),
            ])
        
        let skewH = UIInterpolatingMotionEffect(keyPath: "layer.transform", type: .tiltAlongHorizontalAxis)
        skewH.minimumRelativeValue = skewValue(y: -1)
        skewH.maximumRelativeValue = skewValue(y: 1)
        
        let skewV = UIInterpolatingMotionEffect(keyPath: "layer.transform", type: .tiltAlongVerticalAxis)
        skewV.minimumRelativeValue = skewValue(x: -1)
        skewV.maximumRelativeValue = skewValue(x: 1)
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [skewH, skewV]
        card.addMotionEffect(group)
    }
}

func skewValue(x: CGFloat = 0, y: CGFloat = 0) -> CATransform3D {
    var transform = CATransform3DIdentity
    transform.m34 = 1 / 1000
    return CATransform3DRotate(transform, 60 * CGFloat.pi / 180, x, y, 0)
}

let vc = ViewController()
PlaygroundPage.current.liveView = vc
