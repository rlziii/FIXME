import UIKit

class NumbersCollectionViewController: UICollectionViewController {
    // MARK: - Private Properties

    private let english = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
    private let spanish = ["uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve", "diez"]
    private let french = ["un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix"]
    private let japanese = ["ichi", "ni", "san", "yon", "go", "roku", "nana", "hachi", "kyū", "jū"]

    // MARK: - Initialization

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UITableView Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Numbers"

        collectionView.register(
            NumbersCollectionViewCell.self,
            forCellWithReuseIdentifier: NumbersCollectionViewCell.reuseIdentifier
        )

        collectionView.register(
            NumbersCollectionViewHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: NumbersCollectionViewHeader.reuseIdentifier
        )
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.headerReferenceSize = CGSize(width: view.bounds.width, height: 44)
        }
    }

    // MARK: - UICollectionViewDataSource Methods

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return english.count
        } else if section == 1 {
            return spanish.count
        } else if section == 2 {
            return french.count
        } else if section == 3 {
            return japanese.count
        } else {
            fatalError("Invalid section.")
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let text: String

        if indexPath.section == 0 {
            text = english[indexPath.item]
        } else if indexPath.section == 1 {
            text = spanish[indexPath.item]
        } else if indexPath.section == 2 {
            text = french[indexPath.row]
        } else if indexPath.section == 3 {
            text = japanese[indexPath.row]
        } else {
            fatalError("Invalid section.")
        }

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: NumbersCollectionViewCell.reuseIdentifier,
            for: indexPath
        )

        if let cell = cell as? NumbersCollectionViewCell {
            cell.configure(with: text)
        }

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: NumbersCollectionViewHeader.reuseIdentifier,
            for: indexPath
        )

        let title: String

        if indexPath.section == 0 {
            title = "English"
        } else if indexPath.section == 1 {
            title = "Spanish"
        } else if indexPath.section == 2 {
            title = "French"
        } else if indexPath.section == 3 {
            title = "Japanese"
        } else {
            fatalError("Invalid section.")
        }

        if let header = header as? NumbersCollectionViewHeader {
            header.configure(with: title)
        }

        return header
    }
}
