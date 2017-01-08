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
    var flowNavigationController:UINavigationController!
    
    override init(navigationController:UINavigationController) {
        super.init(navigationController: navigationController)
        self.flowNavigationController = UINavigationController()
        self.flowNavigationController.navigationBar.barTintColor = UIColor.brown
        navigationController.present(self.flowNavigationController, animated: false) {
            //nil
        }
    }
    
    // MARK: Start

    public func start() {
        self.flowNavigationController.setNavigationBarHidden(false, animated: false)
        let startVC = StartupViewController()
        startVC.delegate = self
        self.flowNavigationController.pushViewController(startVC, animated: false)
    }
    
    // MARK: Startup
    
    func startupCompleted(sender: StartupViewController) {
        self.flowNavigationController.dismiss(animated: false) {
            self.delegate?.startupFlowControllerFinished(sender: self)
        }
    }
    
    // MARK: Welcome View
    
    func showWelcome(sender: StartupViewController) {
        let vc = WelcomeViewController()
        vc.delegate = self
        self.flowNavigationController.setNavigationBarHidden(true, animated: false)
        self.flowNavigationController.pushViewController(vc, animated: false)
    }
    
    func welcomeCompleted(sender: WelcomeViewController) {
        self.flowNavigationController.dismiss(animated: false) {
            self.delegate?.startupFlowControllerFinished(sender: self)
        }
    }
    
    
}
