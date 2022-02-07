import UIKit

class NumbersCollectionViewCell: UICollectionViewCell {
    // MARK: - Type Properties

    static var reuseIdentifier: String { String(describing: NumbersCollectionViewCell.self) }

    // MARK: - Private Properties

    private let label = UILabel(frame: .zero)

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Public Methods

    func configure(with text: String) {
        label.text = text
    }

    // MARK: - Private Methods

    private func setupViews() {
        setupLabel()
        setupConstraints()
    }

    private func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
