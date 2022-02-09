import UIKit

class CounterView: UIView {
    // MARK: - Private Properties

    private let stackView = UIStackView(frame: .zero)
    private let minusButton = UIButton(type: .system)
    private let counterLabel = UILabel(frame: .zero)
    private let plusButton = UIButton(type: .system)

    private var buttonActions: ((Action) -> Void)?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Public Methods

    func setupButtonActions(_ buttonActions: @escaping (Action) -> Void) {
        self.buttonActions = buttonActions
    }

    func updateCounterLabel(with count: Int) {
        counterLabel.text = String(count)
    }

    // MARK: - Private Methods

    private func setupViews() {
        backgroundColor = .systemBackground

        setupStackView()
        setupMinusButton()
        setupCounterLabel()
        setupPlusButton()
        setupConstraints()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(minusButton)
        stackView.addArrangedSubview(counterLabel)
        stackView.addArrangedSubview(plusButton)

        addSubview(stackView)
    }

    private func setupMinusButton() {
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.setTitle("-", for: .normal)
        minusButton.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        minusButton.addAction(.init(handler: { [weak self] _ in
            self?.buttonActions?(.minusButtonTapped)
        }), for: .touchUpInside)
    }

    private func setupCounterLabel() {
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.text = String(0)
        counterLabel.font = .preferredFont(forTextStyle: .largeTitle)
        counterLabel.textAlignment = .center
    }

    private func setupPlusButton() {
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        plusButton.addAction(.init(handler: { [weak self] _ in
            self?.buttonActions?(.plusButtonTapped)
        }), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),

            counterLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
        ])
    }
}

extension CounterView {
    enum Action {
        case minusButtonTapped
        case plusButtonTapped
    }
}
