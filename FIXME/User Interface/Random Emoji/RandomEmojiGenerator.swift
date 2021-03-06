class RandomEmojiGenerator {
    // MARK: Private Properties

    private let emoji = [
        "๐", "๐", "๐", "๐", "๐", "๐คฃ", "๐", "๐", "๐", "๐",
        "๐", "๐", "๐ฅฐ", "๐", "๐คฉ", "๐", "๐", "โบ๏ธ", "๐", "๐",
        "๐ฅฒ", "๐", "๐", "๐", "๐คช", "๐", "๐ค", "๐ค", "๐คญ", "๐คซ",
        "๐ค", "๐ค", "๐คจ", "๐", "๐", "๐ถ", "๐ถโ๐ซ๏ธ", "๐", "๐", "๐",
        "๐ฌ", "๐ฎโ๐จ", "๐คฅ", "๐", "๐", "๐ช", "๐คค", "๐ด", "๐ท", "๐ค",
        "๐ค", "๐คข", "๐คฎ", "๐คง", "๐ฅต", "๐ฅถ", "๐ฅด", "๐ต", "๐ตโ๐ซ", "๐คฏ",
        "๐ค ", "๐ฅณ", "๐ฅธ", "๐", "๐ค", "๐ง", "๐", "๐", "๐", "โน๏ธ",
        "๐ฎ", "๐ฏ", "๐ฒ", "๐ณ", "๐ฅบ", "๐ฆ", "๐ง", "๐จ", "๐ฐ", "๐ฅ",
        "๐ข", "๐ญ", "๐ฑ", "๐", "๐ฃ", "๐", "๐", "๐ฉ", "๐ซ", "๐ฅฑ",
        "๐ค", "๐ก", "๐ ", "๐คฌ", "๐", "๐ฟ", "๐", "๐คก", "๐", "๐ฝ",
    ]

    // MARK: Public Properties

    var delegate: RandomEmojiDelegate?

    // MARK: Public Methods

    func generateRandomEmoji() {
        let emoji = emoji.randomElement()!
        delegate?.displayEmoji(emoji)
    }
}
