//
//  MainFlowController.swift
//  CoordSample
//
//  Created by David Merino on 12/31/16.
//  Copyright © 2016 David Merino. All rights reserved.
//

import UIKit

class MainFlowController: BaseFlowController {

    
    override init(navigationController:UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    public func start() {
        let startVC = MainTabBarViewController()
        self.navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController.view.layer.add(BaseFlowController.fadeAnimation(), forKey: nil)
        self.navigationController.pushViewController(startVC, animated: false)
        self.navigationController.viewControllers = [startVC]
    }
}
