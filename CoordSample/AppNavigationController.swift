import UIKit

protocol AppNavigationControllerDelegate: class {
}

class AppNavigationController: UINavigationController {
    
    weak var appNavigationControllerDelegate:AppNavigationControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
