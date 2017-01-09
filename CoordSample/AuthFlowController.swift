import UIKit

protocol AuthFlowControllerDelegate: class {
    func authFlowControllerFinished(sender: AuthFlowController)
}

class AuthFlowController: BaseFlowController, AuthLoginViewControllerDelegate, AuthSignupViewControllerDelegate {
    
    weak var delegate:AuthFlowControllerDelegate?
    
    public func start() {
        self.showLogin()
    }
    
    func showLogin() {
        self.appNavigationController.setNavigationBarHidden(false, animated: true)
        let startVC = AuthLoginViewController()
        startVC.delegate = self
        self.appNavigationController.view.layer.add(BaseFlowController.flowFadeTransition(), forKey: nil)
        self.appNavigationController.setViewControllers([startVC], animated: false)
    }
    
    public func showSignup() {
        let startVC = AuthSignupViewController()
        startVC.delegate = self
        self.appNavigationController.pushViewController(startVC, animated: true)
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
