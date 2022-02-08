import UIKit

class RandomEmojiViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var randomEmojiView = RandomEmojiView(frame: .zero)
    private let randomEmojiGenerator = RandomEmojiGenerator()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = randomEmojiView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Random Emoji"

        randomEmojiView.setupButtonActions { [unowned self] action in
            switch action {
            case .generateRandomEmojiButtonTapped:
                generateRandomEmojiButtonTapped()
            }
        }

        randomEmojiGenerator.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        randomEmojiGenerator.generateRandomEmoji()
    }

    // MARK: - Private Methods

    private func generateRandomEmojiButtonTapped() {
        randomEmojiGenerator.generateRandomEmoji()
    }
}

extension RandomEmojiViewController: RandomEmojiDelegate {
    func displayEmoji(_ emoji: String) {
        randomEmojiView.updateEmojiLabel(with: emoji)
    }
}
