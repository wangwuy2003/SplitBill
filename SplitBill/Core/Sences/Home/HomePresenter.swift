//
//  HomePresenter.swift
//  HomePresenter
//
//  Created by TGG on 21/03/25.
//

import UIKit

class HomePresenter {
    var router: CoreRouter
    var homeManager: HomeManager
    
    init(homeManager: HomeManager, router: CoreRouter) {
        self.homeManager = homeManager
        self.router = router
    }
}
