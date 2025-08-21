//
//  UIApplication+Exts.swift
//  AINoteTaker
//
//  Created by Luong Manh on 23/3/25.
//

import UIKit

extension UIApplication {
    // MARK: Choose keyWindow as per your choice
    var keyWindow: UIWindow? {
        if let lastWindow = connectedScenes.compactMap({ ($0 as? UIWindowScene)?.keyWindow }).last {
            return lastWindow
        } else {
            return self.connectedScenes
                .first(where: { $0.activationState == .foregroundActive })
                .map { $0 as? UIWindowScene }
                .flatMap { $0 }?.windows
                .first(where: \.isKeyWindow)
        }
    }
    
    static func topMostViewController(
        base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
    )
    -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topMostViewController(base: nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            
            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return topMostViewController(base: top)
            } else if let selected = tab.selectedViewController {
                return topMostViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topMostViewController(base: presented)
        }
        return base
    }
}
