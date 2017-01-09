import UIKit

protocol SettingsViewControllerDelegate: class {
}

class SettingsViewController: BaseViewController {
    
    weak var delegate:SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        self.title = "Settings"
        let primaryButton = self.addButton(title: "")
        primaryButton.addTarget(self, action: #selector(SettingsViewController.primaryButtonTap(_:)), for: .touchUpInside)
    }
    
    func primaryButtonTap(_ button: UIButton) {
        print("TAP")
    }
}
