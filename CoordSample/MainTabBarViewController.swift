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
    }

}
