
import UIKit

final class HomeViewController: UIViewController {
    
    private let tupButton = UIButton()
    
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
    }
    
    @objc
    private func loadImage() {
        fetchImage()
    }
}

//MARK: - Setting View

private extension HomeViewController {
    func setupView() {
        
        addSubViews()
        setupLayout()
        addActions()
        
        setupButton()
    }
}

//MARK: - Setting

private extension HomeViewController {
    func addSubViews() {
        [tupButton].forEach { subView in
            view.addSubview(subView)
        }
    }
    
    func addActions() {
        tupButton.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
    }
    
    func setupButton() {
        tupButton.setTitle("Tup Me", for: .normal)
        tupButton.backgroundColor = .systemBlue
        tupButton.tintColor = .white
        tupButton.layer.cornerRadius = 10
    }
    
    
}

//MARK: - Layout

private extension HomeViewController {
    func setupLayout() {
        [tupButton].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            tupButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            tupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tupButton.heightAnchor.constraint(equalToConstant: 100),
            tupButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

private extension HomeViewController {
    private func fetchImage() {
        guard let url = URL(string: "https://api.coinbase.com/v2/currencies") else { return }
        
        networkManager.downloadData(from: url)
    }
}
