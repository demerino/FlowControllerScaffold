import UIKit

protocol MainFlowControllerDelegate: class {
    //TODO
}

class MainFlowController: BaseFlowController {

    weak var delegate:MainFlowControllerDelegate?

    public func start() {
        let startVC = MainTabBarViewController()
        self.appNavigationController.setNavigationBarHidden(true, animated: false)
        self.appNavigationController.view.layer.add(BaseFlowController.fadeAnimation(), forKey: nil)
        self.appNavigationController.pushViewController(startVC, animated: false)
        self.appNavigationController.viewControllers = [startVC]
    }
    
}
