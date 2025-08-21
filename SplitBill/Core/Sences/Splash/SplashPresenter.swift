//
//  SplashPresenter.swift
//  SplashPresenter
//
//  Created by TGG on 21/03/25.
//

import UIKit

class SplashPresenter {
   var router: CoreRouter
    
    init(router: CoreRouter) {
        self.router = router
    }
    
    func navigateToHome() {
        router.navigateHome()
    }
}
