//
//  StartupFlowController.swift
//  CoordSample
//
//  Created by David Merino on 12/31/16.
//  Copyright © 2016 David Merino. All rights reserved.
//

import UIKit

protocol StartupFlowControllerDelegate: class {
    func startupFlowControllerFinished(sender: StartupFlowController)
}

class StartupFlowController: BaseFlowController, StartupViewControllerDelegate, WelcomeViewControllerDelegate {

    
    weak var delegate:StartupFlowControllerDelegate?
    
    override init(navigationController:UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    // MARK: Start

    public func start() {
        self.navigationController.setNavigationBarHidden(false, animated: true)
        let startVC = StartupViewController()
        startVC.delegate = self
        self.navigationController.view.layer.add(BaseFlowController.fadeAnimation(), forKey: nil)
        self.navigationController.pushViewController(startVC, animated: false)
        self.navigationController.viewControllers = [startVC]
    }
    
    // MARK: Startup
    
    func startupCompleted(sender: StartupViewController) {
        self.delegate?.startupFlowControllerFinished(sender: self)
    }
    
    // MARK: Welcome View
    
    func showWelcome(sender: StartupViewController) {
        let vc = WelcomeViewController()
        vc.delegate = self
        self.navigationController.setNavigationBarHidden(true, animated: true)
        self.navigationController.pushViewController(vc, animated: false)
    }
    
    func welcomeCompleted(sender: WelcomeViewController) {
        self.delegate?.startupFlowControllerFinished(sender: self)
    }
    
    
}
