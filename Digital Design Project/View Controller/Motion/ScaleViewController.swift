//
//  ScaleViewController.swift
//  Digital Design Project
//
//  Created by BumMo Koo on 30/05/2019.
//  Copyright © 2019 BumMo Koo. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {
    @IBOutlet weak var cardView: UIView!
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        addParallax(to: cardView)
    }
    
    // MARK: - Action
    func addParallax(to view: UIView) {
        let amount = 1
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "layer.transform.scale.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "layer.transform.scale.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let verticalSkew = UIInterpolatingMotionEffect(keyPath: "layer.transform", type: .tiltAlongVerticalAxis)
        verticalSkew.minimumRelativeValue = skewValue(x: -1)
        verticalSkew.maximumRelativeValue = skewValue(x: 1)

        let horizontalSkew = UIInterpolatingMotionEffect(keyPath: "layer.transform", type: .tiltAlongHorizontalAxis)
        horizontalSkew.minimumRelativeValue = skewValue(y: -1)
        horizontalSkew.maximumRelativeValue = skewValue(y: 1)
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical, verticalSkew, horizontalSkew]
        view.addMotionEffect(group)
    }
    
    // MARK: - Private action
    private func skewValue(x: CGFloat = 0, y: CGFloat = 0) -> CATransform3D {
        var transform = CATransform3DIdentity
        transform.m34 = 1 / 1000
        return CATransform3DRotate(transform, 60 * CGFloat.pi / 180, x, y, 0)
    }
}
