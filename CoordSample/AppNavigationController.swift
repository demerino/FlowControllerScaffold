import UIKit

protocol AppNavigationControllerDelegate: class {
    func appNavigationControllerDidAppear(sender: AppNavigationController)
}

class AppNavigationController: UINavigationController {
    
    weak var appNavigationControllerDelegate:AppNavigationControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if ((self.appNavigationControllerDelegate) != nil) {
            self.appNavigationControllerDelegate?.appNavigationControllerDidAppear(sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
