class RandomEmojiGenerator {
    // MARK: Private Properties

    private let emoji = ["😀", "😅", "😂", "🙃", "😍", "😎", "🤩", "🙁", "🥺", "😱"]

    // MARK: Public Properties

    var delegate: RandomEmojiDelegate?

    // MARK: Public Methods

    func generateRandomEmoji() {
        let emoji = emoji.randomElement()!
        delegate?.displayEmoji(emoji)
    }
}
