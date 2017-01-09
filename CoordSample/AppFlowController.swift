import UIKit

class AppFlowController: BaseFlowController, AuthFlowControllerDelegate, StartupFlowControllerDelegate, AppNavigationControllerDelegate, MainFlowControllerDelegate {
    
    // MARK: 
    var initialAppearance = false
    
    override init(appNavigationController:AppNavigationController) {
        super.init(appNavigationController: appNavigationController)
        appNavigationController.navigationBar.barTintColor = UIColor.red
        appNavigationController.setNavigationBarHidden(true, animated: false)
    }
    
    public func start() {
        let flow = StartupFlowController(appNavigationController: self.appNavigationController)
        flow.delegate = self
        self.childFlows.append(flow)
        flow.start()
    }
    
    // MARK: Auth Flow
    
    public func startAuthFlow() {
        let authFlow = AuthFlowController(appNavigationController: self.appNavigationController)
        authFlow.delegate = self
        self.childFlows.append(authFlow)
        authFlow.start()
    }
    
    public func startupFlowControllerFinished(sender: StartupFlowController) {
        self.childFlows.removeObject(obj: sender)
        //TODO if logged in then go to Main
        self.startAuthFlow()
    }
    
    // MARK: Auth Flow
    
    func authFlowControllerFinished(sender: AuthFlowController) {
        self.childFlows.removeObject(obj: sender)
        self.startMainFlow()
    }
    
    func startMainFlow() {
        let mainFlow = MainFlowController(appNavigationController: self.appNavigationController)
        mainFlow.delegate = self
        self.childFlows.append(mainFlow)
        mainFlow.start()
    }
    
    // MARK: App Navigation
    
    func appNavigationControllerDidAppear(sender: AppNavigationController) {
        if (!self.initialAppearance) {
            self.initialAppearance = true
            self.start()
        }
    }
    
    // MARK: Content
    
    func showContent() {
        //make sure you show the next flow!
    }
}

