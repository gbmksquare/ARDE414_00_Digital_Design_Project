//
//  GravityViewController.swift
//  Digital Design Project
//
//  Created by BumMo Koo on 30/05/2019.
//  Copyright © 2019 BumMo Koo. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    private var isGravityEnabled = false
    
    private var animator: UIDynamicAnimator!
    private var gravity: UIGravityBehavior!
    private var collision: UICollisionBehavior!
    private var behavior: UIDynamicItemBehavior!
    private var snapping1: UISnapBehavior!
    private var snapping2: UISnapBehavior!
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        animator = UIDynamicAnimator(referenceView: cardView)
        
        gravity = UIGravityBehavior(items: [nameLabel, subtitleLabel])
        
        collision = UICollisionBehavior(items: [nameLabel, subtitleLabel])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)

        behavior = UIDynamicItemBehavior(items: [nameLabel, subtitleLabel])
        behavior.elasticity = 0.6
        animator.addBehavior(behavior)
    }
    
    override func viewDidLayoutSubviews() {
        if snapping1 == nil && snapping2 == nil {
            snapping1 = UISnapBehavior(item: nameLabel, snapTo: nameLabel.frame.origin)
            snapping2 = UISnapBehavior(item: subtitleLabel, snapTo: subtitleLabel.frame.origin)
        }
    }
    
    // MARK: - Action
    @IBAction func tapped(_ tap: UITapGestureRecognizer) {
        isGravityEnabled = !isGravityEnabled
        if isGravityEnabled == true {
            addGravity()
            removeSnapping()
        } else {
            removeGravity()
            addSnapping()
        }
    }
    
    private func addGravity() {
        animator.addBehavior(gravity)
    }
    
    private func removeGravity() {
        animator.removeBehavior(gravity)
    }
    
    private func addSnapping() {
        animator.addBehavior(snapping1)
        animator.addBehavior(snapping2)
    }
    
    private func removeSnapping() {
        animator.removeBehavior(snapping1)
        animator.removeBehavior(snapping2)
    }
}
