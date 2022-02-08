import UIKit

class MainView: UIView {
    // MARK: - Private Properties

    private let stackView = UIStackView(frame: .zero)

    private var buttonActions: ((Action) -> Void)?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Public Methods

    func setupButtonActions(_ buttonActions: @escaping (Action) -> Void) {
        self.buttonActions = buttonActions
    }

    // MARK: - Private Methods

    private func setupViews() {
        backgroundColor = .systemBackground

        setupStackView()
        setupButtons()
        setupConstraints()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        addSubview(stackView)
    }

    private func setupButtons() {
        Action.allCases.forEach { action in
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(action.title, for: .normal)
            button.addAction(.init(handler: { [weak self] _ in
                self?.buttonActions?(action)
            }), for: .touchUpInside)

            stackView.addArrangedSubview(button)
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

extension MainView {
    enum Action: CaseIterable {
        case randomStringsButtonTapped
        case numbersButtonTapped
        case counterButtonTapped
        case randomEmojiButtonTapped

        fileprivate var title: String {
            switch self {
            case .randomStringsButtonTapped:
                return "Random Strings"
            case .numbersButtonTapped:
                return "Numbers"
            case .counterButtonTapped:
                return "Counter"
            case .randomEmojiButtonTapped:
                return "Random Emoji"
            }
        }
    }
}
