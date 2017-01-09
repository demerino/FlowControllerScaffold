import UIKit

protocol StartupFlowControllerDelegate: class {
    func startupFlowControllerFinished(sender: StartupFlowController)
}

class StartupFlowController: BaseFlowController, StartupViewControllerDelegate, WelcomeFlowControllerDelegate {

    weak var delegate:StartupFlowControllerDelegate?
    
    // MARK: Start

    public func start() {
        self.showStartup()
    }
    
    // MARK: Startup
    
    func showStartup() {
        self.appNavigationController.setNavigationBarHidden(false, animated: true)
        let startVC = StartupViewController()
        startVC.delegate = self
        self.appNavigationController.view.layer.add(BaseFlowController.flowFadeTransition(), forKey: nil)
        self.appNavigationController.setViewControllers([startVC], animated: false)
    }
    
    func startupCompleted(sender: StartupViewController) {
        self.delegate?.startupFlowControllerFinished(sender: self)
    }
    
    // MARK: Welcome flow
    
    func showWelcome(sender: StartupViewController) {
        let welcomeFlow = WelcomeFlowController(appNavigationController: self.appNavigationController)
        welcomeFlow.delegate = self
        self.childFlows.append(welcomeFlow)
        welcomeFlow.start()
    }
    
    func welcomeFlowControllerCompleted(sender: WelcomeFlowController) {
        self.childFlows = []
        self.delegate?.startupFlowControllerFinished(sender: self)
    }
}
