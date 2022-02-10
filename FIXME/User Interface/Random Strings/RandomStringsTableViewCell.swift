import UIKit

class RandomStringsTableViewCell: UITableViewCell {
    // MARK: - Type Properties

    static var cellIdentifier: String { String(describing: RandomStringsTableViewCell.self) }

    // MARK: - Private Properties

    private let label = UILabel(frame: .zero)

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    @available(*, unavailable)
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
            label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
        ])
    }
}
