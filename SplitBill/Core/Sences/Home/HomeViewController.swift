//
//  HomeViewController.swift
//  HomeViewController
//
//  Created by TGG Team on 21/03/25.
//

import UIKit
import Stevia

final class HomeViewController: UIViewController {
    private lazy var label = UILabel()
    
    private let presenter: HomePresenter

    init(presenter: HomePresenter) {
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
        styleView()
    }
}

// MARK: - Setup Subviews
extension HomeViewController {
    private func setupViews() {
        view.subviews {
            label
        }
    }
    
    private func setupConstraints() {
        label.centerInContainer()
    }
    
    private func styleView() {
        view.backgroundColor = .orange
        label.style {
            $0.text = "Home"
            $0.font = .systemFont(ofSize: 30, weight: .semibold)
            $0.textColor = .white
        }
    }
}
