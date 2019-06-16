//
//  MPParallaxAccelerometerViewController.swift
//  Digital Design Project
//
//  Created by BumMo Koo on 16/06/2019.
//  Copyright © 2019 BumMo Koo. All rights reserved.
//

import UIKit

class MPParallaxAccelerometerViewController: UIViewController {
    @IBOutlet weak var cardView: MPParallaxView!
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        cardView.prepareForNewViews()
        cardView.prepareParallaxLook()
    }
}
