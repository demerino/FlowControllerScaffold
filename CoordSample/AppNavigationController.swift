import UIKit

protocol AppNavigationControllerDelegate: class {
    func appNavigationControllerDidAppear(sender: AppNavigationController)
}

class AppNavigationController: UINavigationController {
    
    weak var appNavigationControllerDelegate:AppNavigationControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if ((self.appNavigationControllerDelegate) != nil) {
            self.appNavigationControllerDelegate?.appNavigationControllerDidAppear(sender: self)
        }
    }

}
