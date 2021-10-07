import UIKit

class RandomStringsTableViewController: UITableViewController {
    // MARK: - Private Type Properties

    private static let cellIdentifier = "RandomStringsTableViewCellIdentifier"
    private static let stringCount = 10_000

    // MARK: - Private Properties

    private let randomStrings = RandomStringsGenerator.generate(count: stringCount)

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)

        title = "Random Strings"
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: - UITableViewDataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Self.stringCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let randomStrings = randomStrings.sorted()
        let randomString = randomStrings[indexPath.row]

        let cell: UITableViewCell

        if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier) {
            cell = dequeuedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: Self.cellIdentifier)
        }

        cell.textLabel?.text = randomString

        return cell
    }
}
