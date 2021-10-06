import Foundation

struct RandomStringsGenerator {
    // MARK: - Type Methods

    static func generate(count: Int) -> [String] {
        var randomStringArray = [String]()
        randomStringArray.reserveCapacity(count)

        for _ in (0 ..< count) {
            randomStringArray.append(createRandomString(maxLength: 30))
        }

        return randomStringArray
    }

    // MARK: - Private Type Methods

    private static func createRandomString(maxLength: Int) -> String {
        let randomLength = Int.random(in: 1 ... maxLength)
        let letters = "abcdefghijklmnopqrstuvwxyz"
        let characters = (0 ..< randomLength).map { _ in letters.randomElement()! }
        return String(characters)
    }
}
