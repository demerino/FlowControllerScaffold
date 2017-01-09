import UIKit

protocol ProjectViewControllerDelegate: class {
}

class ProjectViewController: BaseViewController {
    
    weak var delegate:ProjectViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        self.title = "Project"
        let primaryButton = self.addButton(title: "")
        primaryButton.addTarget(self, action: #selector(ProjectViewController.primaryButtonTap(_:)), for: .touchUpInside)
    }
    
    func primaryButtonTap(_ button: UIButton) {
        print("TAP")
    }
}
