import UIKit

protocol WelcomeViewControllerDelegate: class {
    func welcomeCompleted(sender: WelcomeViewController)
}

class WelcomeViewController: BaseViewController {
    
    weak var delegate:WelcomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        self.title = "Welcome"
        let primaryButton = self.addButton(title: "Welcome Done")
        primaryButton.addTarget(self, action: #selector(WelcomeViewController.primaryButtonTap(_:)), for: .touchUpInside)
    }
    
    func primaryButtonTap(_ button: UIButton) {
        self.delegate?.welcomeCompleted(sender: self)
    }
}
