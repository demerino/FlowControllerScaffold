import UIKit

protocol ProjectViewControllerDelegate: class {
    //func startupCompleted(sender: ViewController)
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
        //self.delegate?.startupCompleted(sender: self)
    }
}
