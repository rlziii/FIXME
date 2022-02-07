import UIKit

class MainView: UIView {
    // MARK: - Private Properties

    private let stackView = UIStackView(frame: .zero)
    private let tableViewButton = UIButton(type: .system)
    private let collectionViewButton = UIButton(type: .system)
    private let counterViewButton = UIButton(type: .system)

    private var buttonActions: ((Action) -> Void)?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Public Methods

    func setupButtonActions(_ buttonActions: @escaping (Action) -> Void) {
        self.buttonActions = buttonActions
    }

    // MARK: - Private Methods

    private func setupViews() {
        backgroundColor = .systemBackground

        setupStackView()
        setupTableViewButton()
        setupCollectionViewButton()
        setupCounterViewButton()
        setupConstraints()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        stackView.addArrangedSubview(tableViewButton)
        stackView.addArrangedSubview(collectionViewButton)
        stackView.addArrangedSubview(counterViewButton)

        addSubview(stackView)
    }

    private func setupTableViewButton() {
        tableViewButton.translatesAutoresizingMaskIntoConstraints = false
        tableViewButton.setTitle("Table View", for: .normal)
        tableViewButton.addAction(.init(handler: { [weak self] _ in
            self?.buttonActions?(.tableViewButtonTapped)
        }), for: .touchUpInside)
    }

    private func setupCollectionViewButton() {
        collectionViewButton.translatesAutoresizingMaskIntoConstraints = false
        collectionViewButton.setTitle("Collection View", for: .normal)
        collectionViewButton.addAction(.init(handler: { [weak self] _ in
            self?.buttonActions?(.collectionViewButtonTapped)
        }), for: .touchUpInside)
    }

    private func setupCounterViewButton() {
        counterViewButton.translatesAutoresizingMaskIntoConstraints = false
        counterViewButton.setTitle("Counter View", for: .normal)
        counterViewButton.addAction(.init(handler: { [weak self] _ in
            self?.buttonActions?(.counterViewButtonTapped)
        }), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    private func resetConstraints() {
        removeConstraints(constraints)

        setupViews()
        setupConstraints()
    }
}

extension MainView {
    enum Action {
        case tableViewButtonTapped
        case collectionViewButtonTapped
        case counterViewButtonTapped
    }
}
