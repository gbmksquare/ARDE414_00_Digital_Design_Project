//
//  MPParallaxImageAccelerometerViewController.swift
//  Digital Design Project
//
//  Created by BumMo Koo on 16/06/2019.
//  Copyright © 2019 BumMo Koo. All rights reserved.
//

import UIKit

class MPParallaxImageAccelerometerViewController: UIViewController {
    @IBOutlet weak var cardView: MPParallaxView!
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        cardView.prepareForNewViews()
        
        (2...4).forEach { index in
            let image = UIImage(named: "\(index)")!
            let imageView = UIImageView(image: image)
            cardView.insertSubview(imageView, at: 0)
            imageView.frame = cardView.bounds
        }
        
        cardView.prepareParallaxLook()
    }
}
