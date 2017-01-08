//
//  ViewControllerB.swift
//  CoordSample
//
//  Created by David Merino on 12/28/16.
//  Copyright © 2016 David Merino. All rights reserved.
//

import UIKit

protocol AuthSignupViewControllerDelegate: class {
    func signupCompleted(sender: AuthSignupViewController)
}

class AuthSignupViewController: BaseViewController {

    weak var delegate:AuthSignupViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        self.title = "Signup Screen"
        let signupButton = self.addButton(title: "Complete Startup")
        signupButton.addTarget(self, action: #selector(AuthSignupViewController.signupButtonTap(_:)), for: .touchUpInside)
    }
    
    func signupButtonTap(_ button: UIButton) {
        self.delegate?.signupCompleted(sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
