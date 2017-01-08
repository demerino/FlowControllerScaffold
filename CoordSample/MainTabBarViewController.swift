//
//  MainTabBarViewController.swift
//  CoordSample
//
//  Created by David Merino on 1/2/17.
//  Copyright © 2017 David Merino. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let feed = FeedViewController()
        let feedNav = UINavigationController(rootViewController: feed)
        feedNav.title = "Feed"

        
        let profile = ProfileViewController()
        let profileNav = UINavigationController(rootViewController: profile)
        profileNav.title = "Profile"

        
        self.viewControllers = [feedNav, profileNav]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
