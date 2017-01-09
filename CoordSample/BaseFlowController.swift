import UIKit

extension Array {
    mutating func removeObject<T>(obj: T) where T : Equatable {
        self = self.filter({$0 as? T != obj})
    }
}

class BaseFlowController: NSObject {

    static let defaultFlowAnimationDuration = 0.3

    var appNavigationController:AppNavigationController!
    var childFlows:Array = [Any]()
    
    public init(appNavigationController:AppNavigationController) {
        self.appNavigationController = appNavigationController
        super.init()
    }
    
    //kCATransitionReveal = push backwards (like a pop)
    //kCATransitionMoveIn = push but over the top (doesn't move current view controller)
    //kCATransitionFade = fade
    //kCATransitionPush = push
    
    class func fadeAnimation() -> CATransition {
        let transition = CATransition()
        transition.duration = defaultFlowAnimationDuration
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        return transition
    }

}
