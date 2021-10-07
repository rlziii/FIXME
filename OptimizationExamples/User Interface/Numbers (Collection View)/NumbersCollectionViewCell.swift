import UIKit

class NumbersCollectionViewCell: UICollectionViewCell {
    // MARK: - Public Type Properties

    static let reuseIdentifier = "NumbersCollectionViewCell"

    // MARK: - Private Properties

    private let label = UILabel(frame: .zero)

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Public Methods
    
    func configure(with text: String) {
        label.text = text
    }
}
