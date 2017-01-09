import UIKit

protocol AuthFlowControllerDelegate: class {
    func authFlowControllerFinished(sender: AuthFlowController)
}

class AuthFlowController: BaseFlowController, AuthLoginViewControllerDelegate, AuthSignupViewControllerDelegate {
    
    weak var delegate:AuthFlowControllerDelegate?
    
    override init(navigationController:UINavigationController) {
        super.init(navigationController: navigationController)

    }
    
    public func start() {
        self.showLogin()
    }
    
    func showLogin() {
        navigationController.setNavigationBarHidden(false, animated: true)
        let startVC = AuthLoginViewController()
        startVC.delegate = self
        self.navigationController.view.layer.add(BaseFlowController.fadeAnimation(), forKey: nil)
        self.navigationController.pushViewController(startVC, animated: false)
        self.navigationController.viewControllers = [startVC]
    }
    
    public func showSignup() {
        let startVC = AuthSignupViewController()
        startVC.delegate = self
        self.navigationController.pushViewController(startVC, animated: true)
    }
    
    public func authFlowCompleted(sender: AuthLoginViewController) {
        self.delegate?.authFlowControllerFinished(sender: self)
    }
    
    internal func authFlowShowSignup(sender: AuthLoginViewController) {
        self.showSignup()
    }
    public func signupCompleted(sender: AuthSignupViewController) {
        self.delegate?.authFlowControllerFinished(sender: self)
    }
    
}
