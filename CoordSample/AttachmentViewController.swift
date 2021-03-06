import UIKit

protocol AttachmentViewControllerDelegate: class {
}

class AttachmentViewController: BaseViewController {
    
    weak var delegate:AttachmentViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        self.title = "Attachment"
        let primaryButton = self.addButton(title: "")
        primaryButton.addTarget(self, action: #selector(AttachmentViewController.primaryButtonTap(_:)), for: .touchUpInside)
    }
    
    func primaryButtonTap(_ button: UIButton) {
        print("TAP")
    }
}
