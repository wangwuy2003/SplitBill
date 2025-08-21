//
//  Extension.swift
//  AINoteTaker
//
//  Created by Apple on 19/3/25.
//

import Foundation
import UIKit

extension UIView {
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
        
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func addShadowMain(color: UIColor = .black,
                       opacity: Float = 0.1,
                       offset: CGSize = CGSize(width: 2, height: 2),
                       radius: CGFloat = 4) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexValue = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }

    func childVC<T: UIViewController>(ofType type: T.Type) -> T? {
        return children.first { $0 is T } as? T
    }
}

// MARK: - Loading extension
extension UIView {
    private var loadingView: UIView {
        if let view = subviews.first(where: { $0.tag == UIView.loadingViewTag }) {
            return view
        } else {
            let view = createLoadingView()
            addSubview(view)
            return view
        }
    }

    private static var loadingViewTag: Int {
        return 9999
    }

    private func createLoadingView() -> UIView {
        let loadingView = UIView(frame: self.bounds)
        loadingView.backgroundColor = .clear
        loadingView.tag = UIView.loadingViewTag

        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = loadingView.center
        activityIndicator.startAnimating()

        loadingView.addSubview(activityIndicator)
        return loadingView
    }

    func showLoading(backgroundColor: UIColor = .clear) {
        DispatchQueue.main.async {
            self.loadingView.backgroundColor = backgroundColor
            if !self.loadingView.isDescendant(of: self) {
                self.addSubview(self.loadingView)
            }
        }
    }

    func hideLoading() {
        DispatchQueue.main.async {
            self.loadingView.removeFromSuperview()
        }
    }
}

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
