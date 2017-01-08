// AppFlowController - Root flow controller (brain)
// StartupFlowController - loading screen, manifest download, setup models, download any assets, check state (logged in, new user, etc)
// AuthFlowController - (authenticate)
// WelcomeFlowController - (welcome tutorial)
// MainFlowController - (Home Screen Feed, Tab bars/Navigation)
// SettingsFlowController - settings modal stuff
// CreateProjectFlowController
// UploadAttachmentFlowController
// ViewProjectFlowController
// ViewAttachmentFlowController

import UIKit

class AppFlowController: BaseFlowController, AuthFlowControllerDelegate, StartupFlowControllerDelegate, AppNavigationControllerDelegate {
    
    // MARK: 
    var initialAppearance = false
    
    override init(navigationController:UINavigationController) {
        super.init(navigationController: navigationController)
        navigationController.navigationBar.barTintColor = UIColor.red
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    public func start() {
        let flow = StartupFlowController(navigationController: self.navigationController)
        flow.delegate = self
        self.childFlows.append(flow)
        flow.start()
    }
    
    // MARK: Auth Flow
    
    public func startAuthFlow() {
        let authFlow = AuthFlowController(navigationController: self.navigationController)
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
        let mainFlow = MainFlowController(navigationController: self.navigationController)
        //mainFlow.delegate = self
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

