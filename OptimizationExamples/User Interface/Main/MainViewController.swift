import UIKit

class MainViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var mainView = MainView(frame: .zero)
    private let counter = Counter()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
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
            case .randomStringsButtonTapped:
                randomStringsButtonTapped()
            case .numbersButtonTapped:
                numbersButtonTapped()
            case .counterButtonTapped:
                counterButtonTapped()
            case .randomEmojiButtonTapped:
                randomEmojiButtonTapped()
            }
        }
    }

    // MARK: - Private Methods

    private func randomStringsButtonTapped() {
        show(RandomStringsTableViewController(), sender: self)
    }

    private func numbersButtonTapped() {
        show(NumbersCollectionViewController(), sender: self)
    }

    private func counterButtonTapped() {
        show(CounterViewController(counter: counter), sender: self)
    }

    private func randomEmojiButtonTapped() {
        show(RandomEmojiViewController(), sender: self)
    }
}
