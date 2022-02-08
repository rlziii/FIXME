import UIKit

class MainViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var mainView = MainView(frame: .zero)
    private let counter = Counter()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Optimization Examples"

        mainView.setupButtonActions { [unowned self] action in
            switch action {
            case .tableViewButtonTapped:
                tableViewButtonTapped()
            case .collectionViewButtonTapped:
                collectionViewButtonTapped()
            case .counterViewButtonTapped:
                counterViewButtonTapped()
            case .randomEmojiViewButtonTapped:
                randomEmojiViewButtonTapped()
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
        show(CounterViewController(counter: counter), sender: self)
    }

    private func randomEmojiViewButtonTapped() {
        show(RandomEmojiViewController(), sender: self)
    }
}
