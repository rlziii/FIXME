enum RandomStringsGenerator {
    // MARK: - Public Type Methods

    static func generate(count: Int) -> [String] {
        (0 ..< count).map { _ in createRandomString(maxLength: 30) }
    }

    // MARK: - Private Type Methods

    private static func createRandomString(maxLength: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"

        let randomLength = Int.random(in: 1 ... maxLength)
        let characters = (0 ..< randomLength).compactMap { _ in letters.randomElement() }
        return String(characters)
    }
}
