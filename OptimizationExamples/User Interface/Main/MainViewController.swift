import UIKit

class MainViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var mainView = MainView(frame: .zero)

    // MARK: - UIViewController Methods

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Optimization Examples"

        mainView.setupButtonActions { [weak self] action in
            switch action {
            case .tableViewButtonTapped:
                self?.tableViewButtonTapped()
            case .collectionViewButtonTapped:
                self?.collectionViewButtonTapped()
            case .counterViewButtonTapped:
                self?.counterViewButtonTapped()
            }
        }
    }

    // MARK: - Private Methods

    private func tableViewButtonTapped() {
        show(RandomStringsTableViewController(), sender: self)
    }

    private func collectionViewButtonTapped() {
        show(NumbersCollectionViewController(), sender: self)
    }

    private func counterViewButtonTapped() {
        show(CounterViewController(), sender: self)
    }
}
