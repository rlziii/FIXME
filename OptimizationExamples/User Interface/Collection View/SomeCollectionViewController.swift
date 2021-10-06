import UIKit

class SomeCollectionViewController: UICollectionViewController {
    // MARK: - Private Properties

    private let sectionOne = ["one"]
    private let sectionTwo = ["two"]
    private let sectionThree = ["three"]
    private let sectionFour = ["four"]

    // MARK: - UITableView Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(
            SomeCollectionViewCell.self,
            forCellWithReuseIdentifier: SomeCollectionViewCell.cellIdentifier
        )
    }

    // MARK: - UICollectionViewDataSource Methods

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return sectionOne.count
        } else if section == 1 {
            return sectionTwo.count
        } else if section == 2 {
            return sectionThree.count
        } else if section == 3 {
            return sectionFour.count
        } else {
            fatalError("Invalid section.")
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item: String

        if indexPath.section == 0 {
            item = sectionOne[indexPath.item]
        } else if indexPath.section == 1 {
            item = sectionTwo[indexPath.item]
        } else if indexPath.section == 2 {
            item = sectionThree[indexPath.row]
        } else if indexPath.section == 3 {
            item = sectionFour[indexPath.row]
        } else {
            fatalError("Invalid section.")
        }

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SomeCollectionViewCell.cellIdentifier,
            for: indexPath
        )

        if let cell = cell as? SomeCollectionViewCell {
            cell.configure(with: item)
        }

        return cell
    }
}
