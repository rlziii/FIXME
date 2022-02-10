import UIKit

class CounterViewController: UIViewController {
    // MARK: - Private Properties

    private let counter: Counter
    private lazy var counterView = CounterView(frame: .zero)

    // MARK: - Initialization

    init(counter: Counter) {
        self.counter = counter

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Deinitialization

    deinit {
        counter.reset()
    }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = counterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Counter"

        counterView.updateCounterLabel(with: counter.currentCount)

        counterView.setupButtonActions { action in
            switch action {
            case .minusButtonTapped:
                self.updateCount(by: -1)
            case .plusButtonTapped:
                self.updateCount(by: +1)
            }
        }
    }

    // MARK: - Private Methods

    private func updateCount(by amount: Int) {
        counter.currentCount += amount
        counterView.updateCounterLabel(with: counter.currentCount)
    }
}
