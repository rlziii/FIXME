import UIKit

class MainViewController: UIViewController {

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Public Methods

    @IBAction func tableViewButtonTapped() {
        show(RandomStringsTableViewController(), sender: self)
    }
}
