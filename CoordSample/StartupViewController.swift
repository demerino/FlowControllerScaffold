//
//  ViewController.swift
//  CoordSample
//
//  Created by David Merino on 12/28/16.
//  Copyright © 2016 David Merino. All rights reserved.
//

import UIKit

protocol StartupViewControllerDelegate: class {
    func startupCompleted(sender: StartupViewController)
    func showWelcome(sender: StartupViewController)
}

class StartupViewController: BaseViewController {
    
    weak var delegate:StartupViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        self.title = "Startup Screen"
        let startupButton = self.addButton(title: "Complete Startup")
        startupButton.addTarget(self, action: #selector(StartupViewController.completeButtonTap(_:)), for: .touchUpInside)
        let welcomeButton = self.addButton(title: "Show Welcome")
        welcomeButton.addTarget(self, action: #selector(StartupViewController.welcomeButtonTap(_:)), for: .touchUpInside)

    }
    
    func completeButtonTap(_ button: UIButton) {
        self.delegate?.startupCompleted(sender: self)
    }
    
    func welcomeButtonTap(_ button: UIButton) {
        self.delegate?.showWelcome(sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

