import UIKit

class RandomStringsTableViewController: UITableViewController {
    // MARK: - Private Properties

    private let randomStrings = RandomStringsGenerator.generate(count: 10_000)

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Random Strings"

        tableView.register(
            RandomStringsTableViewCell.self,
            forCellReuseIdentifier: RandomStringsTableViewCell.cellIdentifier
        )
    }

    // MARK: - UITableViewDataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10_000
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let randomStrings = randomStrings.sorted()
        let randomString = randomStrings[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: RandomStringsTableViewCell.cellIdentifier, for: indexPath)

        if let cell = cell as? RandomStringsTableViewCell {
            cell.configure(with: randomString)
        }

        return cell
    }
}
