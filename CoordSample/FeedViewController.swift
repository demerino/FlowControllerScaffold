import UIKit

protocol FeedViewControllerDelegate: class {
}

class FeedViewController: BaseViewController {
    
    weak var delegate:FeedViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        self.title = "Feed"
        let primaryButton = self.addButton(title: "Create Project")
        primaryButton.addTarget(self, action: #selector(FeedViewController.primaryButtonTap(_:)), for: .touchUpInside)
    }
    
    func primaryButtonTap(_ button: UIButton) {
        print("TAP")
    }
}
