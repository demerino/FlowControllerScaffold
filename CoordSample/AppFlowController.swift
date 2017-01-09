import UIKit

/*!
 @brief Top level flows should clear the AppNavigationController stack when starting
*/
class AppFlowController: BaseFlowController, AuthFlowControllerDelegate, StartupFlowControllerDelegate, AppNavigationControllerDelegate, MainFlowControllerDelegate {
    
    var initialAppearance = false
    
    // MARK: AppFlowController methods

    override init(appNavigationController:AppNavigationController) {
        super.init(appNavigationController: appNavigationController)
        appNavigationController.navigationBar.barTintColor = UIColor.red
        appNavigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        startStartupFlow()
    }
    
    // MARK: App Navigation
    
    func appNavigationControllerDidAppear(sender: AppNavigationController) {
        if (!self.initialAppearance) {
            self.initialAppearance = true
            self.start()
        }
    }
    
    // MARK: Startup Flow
    
    func startStartupFlow() {
        let flow = StartupFlowController(appNavigationController: self.appNavigationController)
        flow.delegate = self
        self.childFlows.append(flow)
        flow.start()
    }
    
    func startupFlowControllerFinished(sender: StartupFlowController) {
        self.childFlows.removeObject(obj: sender)
        //TODO if logged in then go to Main instead
        self.startAuthFlow()
    }
    
    // MARK: Auth Flow
    
    func startAuthFlow() {
        let authFlow = AuthFlowController(appNavigationController: self.appNavigationController)
        authFlow.delegate = self
        self.childFlows.append(authFlow)
        authFlow.start()
    }
    
    func authFlowControllerFinished(sender: AuthFlowController) {
        self.childFlows.removeObject(obj: sender)
        self.startMainFlow()
    }
    
    // MARK: Main Flow

    func startMainFlow() {
        let mainFlow = MainFlowController(appNavigationController: self.appNavigationController)
        mainFlow.delegate = self
        self.childFlows.append(mainFlow)
        mainFlow.start()
    }
    
    // MARK: Content
    
    func showContent() {
        //TODO fallback to content and analyze + cleanup flows
    }
}

