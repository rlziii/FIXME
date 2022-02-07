import UIKit

class CounterViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var counterView = CounterView(frame: .zero)
    private var count = 0 {
        didSet {
            counterView.updateCounterLabel(with: count)
        }
    }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = counterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Counter"

        counterView.setupButtonActions { action in
            switch action {
            case .minusButtonTapped:
                self.minusButtonTapped()
            case .plusButtonTapped:
                self.plusButtonTapped()
            }
        }
    }

    // MARK: - Private Methods

    private func minusButtonTapped() {
        count -= 1
    }

    private func plusButtonTapped() {
        count += 1
    }
}
