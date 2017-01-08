//
//  AuthFlow.swift
//  CoordSample
//
//  Created by David Merino on 12/28/16.
//  Copyright © 2016 David Merino. All rights reserved.
//

import UIKit

protocol AuthFlowControllerDelegate: class {
    func authFlowControllerFinished(sender: AuthFlowController)
}

class AuthFlowController: BaseFlowController, AuthLoginViewControllerDelegate, AuthSignupViewControllerDelegate {
    
    weak var delegate:AuthFlowControllerDelegate?
    var flowNavigationController:UINavigationController!
    
    override init(navigationController:UINavigationController) {
        super.init(navigationController: navigationController)

        self.flowNavigationController = UINavigationController()
        self.flowNavigationController.navigationBar.barTintColor = UIColor.brown
        navigationController.present(self.flowNavigationController, animated: false) {
            //Do nothing
        }
    }
    
    public func start() {
        self.showLogin()
    }
    
    func showLogin() {
        let startVC = AuthLoginViewController()
        startVC.delegate = self
        self.flowNavigationController.pushViewController(startVC, animated: false)
    }
    
    public func showSignup() {
        let startVC = AuthSignupViewController()
        startVC.delegate = self
        self.flowNavigationController.pushViewController(startVC, animated: true)
    }
    
    public func authFlowCompleted(sender: AuthLoginViewController) {
        self.flowNavigationController.dismiss(animated: false) {
            self.delegate?.authFlowControllerFinished(sender: self)
        }
    }
    
    internal func authFlowShowSignup(sender: AuthLoginViewController) {
        self.showSignup()
    }
    public func signupCompleted(sender: AuthSignupViewController) {
        self.flowNavigationController.dismiss(animated: false) {
            self.delegate?.authFlowControllerFinished(sender: self)
        }
    }
    
}
