//
//  ViewController.swift
//  Digital Design Project
//
//  Created by BumMo Koo on 18/04/2019.
//  Copyright © 2019 BumMo Koo. All rights reserved.
//

import UIKit

/// Reference
/// https://devblogs.microsoft.com/xamarin/add-depth-in-ios-7-with-motion-effects/

class ViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var backgroundCardView1: UIView!
    @IBOutlet private weak var backgroundCardView2: UIView!

    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        addParallax(to: cardView)
        addParallax(to: backgroundCardView1)
        addParallax(to: backgroundCardView2)
    }
    
    // MARK: - Action
    private func addParallax(to view: UIView) {
        let amount = 100
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
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
    
    func skewValue(x: CGFloat = 0, y: CGFloat = 0) -> CATransform3D {
        var transform = CATransform3DIdentity
        transform.m34 = 1 / 1000
        return CATransform3DRotate(transform, 60 * CGFloat.pi / 180, x, y, 0)
    }
}
