//
//  ManagerProvider.swift
//  AINoteTaker
//
//  Created by Luong Manh on 14/3/25.
//

class ManagerProvider {
    static let shared = ManagerProvider()
    var homeManager: HomeManager?

    func makeHomeManager() -> HomeManager {
        if let homeManager = homeManager {
            return homeManager
        } else {
            self.homeManager = HomeManager()
            return self.homeManager!
        }
    }
}
