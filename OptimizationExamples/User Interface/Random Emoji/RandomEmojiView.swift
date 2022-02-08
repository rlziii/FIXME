import UIKit

class RandomEmojiView: UIView {
    // MARK: - Private Properties

    private let stackView = UIStackView(frame: .zero)
    private let generateRandomEmojiButton = UIButton(type: .system)
    private let emojiLabel = UILabel(frame: .zero)

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

    func updateEmojiLabel(with text: String) {
        emojiLabel.text = text
    }

    // MARK: - Private Methods

    private func setupViews() {
        backgroundColor = .systemBackground

        setupStackView()
        setupGenerateRandomEmojiButton()
        setupEmojiLabel()
        setupConstraints()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        stackView.addArrangedSubview(generateRandomEmojiButton)
        stackView.addArrangedSubview(emojiLabel)

        addSubview(stackView)
    }

    private func setupGenerateRandomEmojiButton() {
        generateRandomEmojiButton.translatesAutoresizingMaskIntoConstraints = false
        generateRandomEmojiButton.setTitle("Generate Random Emoji", for: .normal)
        generateRandomEmojiButton.addAction(.init(handler: { [weak self] _ in
            self?.buttonActions?(.generateRandomEmojiButtonTapped)
        }), for: .touchUpInside)
    }

    private func setupEmojiLabel() {
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.text = " "
        emojiLabel.font = .preferredFont(forTextStyle: .largeTitle)
        emojiLabel.textAlignment = .center
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

extension RandomEmojiView {
    enum Action {
        case generateRandomEmojiButtonTapped
    }
}
