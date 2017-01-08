//
//  BaseViewController.swift
//  CoordSample
//
//  Created by David Merino on 12/31/16.
//  Copyright © 2016 David Merino. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {
    
    var buttons = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func addButton(title: String) -> UIButton {
        let newButton = UIButton()
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(newButton)
        newButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        if(self.buttons.count == 0) {
            newButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        } else {
            newButton.topAnchor.constraint(equalTo: (self.buttons.last?.bottomAnchor)!, constant: 4).isActive = true
        }
        self.buttons.append(newButton)
        return newButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
