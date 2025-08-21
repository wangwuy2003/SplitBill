//
//  CoreRouter+Navigate.swift
//  AINoteTaker
//
//  Created by Luong Manh on 25/3/25.
//

import UIKit

extension CoreRouter {
    func navigateHome() {
        navigate(to: builder.homeView(router: self))
    }
}
