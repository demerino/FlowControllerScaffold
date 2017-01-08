//
//  ViewController.swift
//  CoordSample
//
//  Created by David Merino on 12/28/16.
//  Copyright © 2016 David Merino. All rights reserved.
//

import UIKit

protocol AuthLoginViewControllerDelegate: class {
    func authFlowCompleted(sender: AuthLoginViewController)
    func authFlowShowSignup(sender: AuthLoginViewController)
}

class AuthLoginViewController: BaseViewController {

    weak var delegate:AuthLoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login Screen"
        self.view.backgroundColor = UIColor.purple
        let loginButton = self.addButton(title: "Login")
        loginButton.addTarget(self, action: #selector(AuthLoginViewController.loginButtonTap(_:)), for: .touchUpInside)
        let signupButton = self.addButton(title: "Signup")
        signupButton.addTarget(self, action: #selector(AuthLoginViewController.signupButtonTap(_:)), for: .touchUpInside)
    }
    
    func loginButtonTap(_ button: UIButton) {
        self.delegate?.authFlowCompleted(sender: self)
    }

    func signupButtonTap(_ button: UIButton) {
        self.delegate?.authFlowShowSignup(sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

