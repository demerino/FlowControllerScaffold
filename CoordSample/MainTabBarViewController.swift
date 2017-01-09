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
}
