import UIKit

protocol StartupFlowControllerDelegate: class {
    func startupFlowControllerFinished(sender: StartupFlowController)
}

class StartupFlowController: BaseFlowController, StartupViewControllerDelegate, WelcomeViewControllerDelegate {

    weak var delegate:StartupFlowControllerDelegate?
    
    // MARK: Start

    public func start() {
        self.appNavigationController.setNavigationBarHidden(false, animated: true)
        let startVC = StartupViewController()
        startVC.delegate = self
        self.appNavigationController.view.layer.add(BaseFlowController.fadeAnimation(), forKey: nil)
        self.appNavigationController.pushViewController(startVC, animated: false)
        self.appNavigationController.viewControllers = [startVC]
    }
    
    // MARK: Startup
    
    func startupCompleted(sender: StartupViewController) {
        self.delegate?.startupFlowControllerFinished(sender: self)
    }
    
    // MARK: Welcome View
    
    func showWelcome(sender: StartupViewController) {
        let vc = WelcomeViewController()
        vc.delegate = self
        self.appNavigationController.setNavigationBarHidden(true, animated: true)
        self.appNavigationController.pushViewController(vc, animated: false)
    }
    
    func welcomeCompleted(sender: WelcomeViewController) {
        self.delegate?.startupFlowControllerFinished(sender: self)
    }
    
    
}
