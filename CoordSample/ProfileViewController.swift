import UIKit

protocol ProfileViewControllerDelegate: class {
}

class ProfileViewController: BaseViewController {
    
    weak var delegate:ProfileViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        self.title = "Profile"
        let primaryButton = self.addButton(title: "")
        primaryButton.addTarget(self, action: #selector(ProfileViewController.primaryButtonTap(_:)), for: .touchUpInside)
    }
    
    func primaryButtonTap(_ button: UIButton) {
        print("TAP")
    }
}
