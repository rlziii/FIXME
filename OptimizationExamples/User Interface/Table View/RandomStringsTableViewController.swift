import UIKit

class RandomStringsTableViewController: UITableViewController {
    // MARK: - Private Type Properties

    private static let cellIdentifier = "RandomStringsTableViewCellIdentifier"

    // MARK: - Private Properties

    private let randomStrings = RandomStringsGenerator.generate(count: 10_000)

    // MARK: - UITableViewDataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        randomStrings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let randomStrings = randomStrings.sorted()
        let randomString = randomStrings[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier)
            ?? UITableViewCell(style: .default, reuseIdentifier: Self.cellIdentifier)

        cell.textLabel?.text = randomString

        return cell
    }
}
