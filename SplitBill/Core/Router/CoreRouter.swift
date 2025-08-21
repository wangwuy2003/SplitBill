//
//  Router.swift
//  AINoteTaker
//
//  Created by Luong Manh on 14/3/25.
//

import UIKit

struct CoreRouter {
    var navigationController: UINavigationController
    let builder: CoreBuilder
}

extension CoreRouter {
    func navigate(to viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss(completion: (() -> Void)? = nil) {
        UIApplication.topMostViewController()?.dismiss(animated: true, completion: completion)
    }
    
    func present(viewController: UIViewController) {
        UIApplication.topMostViewController()?.present(viewController, animated: true)
    }
}
