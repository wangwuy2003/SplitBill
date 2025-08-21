//
//  SplashViewController.swift
//  SplashViewController
//
//  Created by TGG Team on 21/03/25.
//

import UIKit
import Stevia

final class SplashViewController: UIViewController {
    private lazy var label = UILabel()
    
    private let presenter: SplashPresenter

    init(presenter: SplashPresenter) {
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.presenter.navigateToHome()
        }
    }
}

// MARK: - Setup Subviews
extension SplashViewController {
    private func setupViews() {
        view.subviews {
            label
        }
    }
    
    private func setupConstraints() {
        label.centerInContainer()
    }
    
    private func styleViews() {
        view.backgroundColor = .orange
        label.style {
            $0.text = "Splash"
            $0.font = .systemFont(ofSize: 30, weight: .semibold)
            $0.textColor = .white
        }
    }
}
