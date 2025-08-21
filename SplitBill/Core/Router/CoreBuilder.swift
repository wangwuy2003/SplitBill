//
//  Builder.swift
//  AINoteTaker
//
//  Created by Luong Manh on 25/3/25.
//

import UIKit

struct CoreBuilder {
    
    func homeView(router: CoreRouter) -> HomeViewController {
        let presenter = HomePresenter(homeManager: ManagerProvider.shared.makeHomeManager(),
                                      router: router)
        return HomeViewController(presenter: presenter)
    }
    
    func splashView(router: CoreRouter) -> SplashViewController {
        let presenter = SplashPresenter(router: router)
        return SplashViewController(presenter: presenter)
    }
    
    func loginView(router: CoreRouter) -> LoginViewController {
        let presenter = LoginPresenter(router: router)
        return LoginViewController(presenter: presenter)
    }
}
