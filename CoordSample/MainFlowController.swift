import UIKit

protocol MainFlowControllerDelegate: class {
    //TODO
}

class MainFlowController: BaseFlowController {

    weak var delegate:MainFlowControllerDelegate?

    public func start() {
        let startVC = MainTabBarViewController()
        self.appNavigationController.setNavigationBarHidden(true, animated: false)
        self.appNavigationController.view.layer.add(BaseFlowController.flowFadeTransition(), forKey: nil)
        self.appNavigationController.setViewControllers([startVC], animated: false)
    }
    
}
