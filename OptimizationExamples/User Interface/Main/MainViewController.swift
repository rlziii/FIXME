import UIKit

class MainViewController: UIViewController {
    // MARK: - Private Properties

    private let tableViewButton = UIButton(type: .system)
    private let collectionViewButton = UIButton(type: .system)
    private let stackView = UIStackView(frame: .zero)

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .systemBackground

        tableViewButton.translatesAutoresizingMaskIntoConstraints = false
        tableViewButton.setTitle("Table View", for: .normal)
        tableViewButton.addTarget(self, action: #selector(tableViewButtonTapped), for: .touchUpInside)

        collectionViewButton.translatesAutoresizingMaskIntoConstraints = false
        collectionViewButton.setTitle("Collection View", for: .normal)
        collectionViewButton.addTarget(self, action: #selector(collectionViewButtonTapped), for: .touchUpInside)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.addArrangedSubview(tableViewButton)
        stackView.addArrangedSubview(collectionViewButton)

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Optimization Examples"
    }

    // MARK: - Private Methods

    @objc private func tableViewButtonTapped() {
        show(RandomStringsTableViewController(), sender: self)
    }

    @objc private func collectionViewButtonTapped() {
        show(
            NumbersCollectionViewController(),
            sender: self
        )
    }
}
