import UIKit

protocol WelcomeFlowControllerDelegate: class {
    func welcomeFlowControllerCompleted(sender: WelcomeFlowController)
}

class WelcomeFlowController: BaseFlowController, WelcomeViewControllerDelegate {

    weak var delegate:WelcomeFlowControllerDelegate?

    // MARK: Start
    
    public func start() {
        self.showWelcome()
    }
    
    // MARK: Welcome View
    
    func showWelcome() {
        let vc = WelcomeViewController()
        vc.delegate = self
        self.appNavigationController.setNavigationBarHidden(true, animated: true)
        self.appNavigationController.present(vc, animated: true) { 
            //Do nothing
        }
    }
    
    func welcomeCompleted(sender: WelcomeViewController) {
        sender.dismiss(animated: true) { 
            //
        }
        self.delegate?.welcomeFlowControllerCompleted(sender: self)
    }
    
}
