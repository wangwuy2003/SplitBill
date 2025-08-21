//
//  LoginViewController.swift
//  LoginViewController
//
//  Created by TGG Team on 21/03/25.
//

import UIKit
import Stevia

final class LoginViewController: UIViewController {
    private lazy var mainLabel = UILabel()
    private lazy var googleButton = UIButton()
    
    private let presenter: LoginPresenter

    init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        styleViews()
    }
}

// MARK: - Setup Subviews
extension LoginViewController {
    private func setupViews() {
        view.subviews {
            mainLabel
            googleButton
        }
    }
    
    private func setupConstraints() {
        mainLabel.centerHorizontally()
        mainLabel.top(20)
        
        googleButton.centerInContainer()
    }
    
    private func styleViews() {
        view.backgroundColor = .orange
        mainLabel.style {
            $0.text = "Sign In"
            $0.font = .systemFont(ofSize: 30, weight: .bold)
            $0.textColor = .white
        }
        
        googleButton.style {
            $0.setTitle("Sign in with Google", for: .normal)
            $0.tintColor = .white
            $0.setTitleColor(.black, for: .normal)
        }
    }
}
