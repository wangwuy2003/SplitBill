//
//  Application.swift
//  AINoteTaker
//
//  Created by Luong Manh on 11/3/25.
//

import UIKit

class Application {
    
    static let shared = Application()
    
    private init() {
    }
}

// MARK: - Config main interface
extension Application {
    
    private var hasCompletedIAP: Bool {
        UserDefaults.standard.bool(forKey: Constants.hasCompletedIAP)
    }
    
    private var hasCompletedOnboarding: Bool {
        UserDefaults.standard.bool(forKey: Constants.hasCompletedOnboarding)
    }
    
    func markOnboardingCompleted() {
        UserDefaults.standard.set(true, forKey: Constants.hasCompletedOnboarding)
    }
        
    func markIAPCompleted() {
        UserDefaults.standard.set(true, forKey: Constants.hasCompletedIAP)
    }
    
    func configMainInterface(in window: UIWindow) {
        let navigationController = UINavigationController()
        let builder = CoreBuilder()
        let router = CoreRouter(navigationController: navigationController, builder: builder)

        navigationController.setViewControllers([builder.splashView(router: router)],
                                                    animated: false)
        
        navigationController.isNavigationBarHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
