import UIKit

extension Array {
    mutating func removeObject<T>(obj: T) where T : Equatable {
        self = self.filter({$0 as? T != obj})
    }
}

class BaseFlowController: NSObject {
    var navigationController:UINavigationController!
    var childFlows:Array = [Any]()
    
    public init(navigationController:UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    class func fadeAnimation() -> CATransition {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        return transition
    }
    
}
