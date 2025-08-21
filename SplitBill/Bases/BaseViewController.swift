//
//  BaseViewController.swift
//  AINoteTaker
//
//  Created by Luong Manh on 11/3/25.
//

import UIKit

class BaseViewController: UIViewController {
    var isShowLoading = false {
        didSet {
            DispatchQueue.main.async {
                if !self.isShowLoading {
                    self.view.hideLoading()
                }
            }
        }
    }

    var isLoadingBackgroundVisible = false

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if isShowLoading {
            self.view.showLoading(
                backgroundColor: isLoadingBackgroundVisible
                ? .black.withAlphaComponent(0.5) : .clear
            )
        } else {
            self.view.hideLoading()
        }
    }

    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }

    /// Present UIActivityViewController with proper iPad popover configuration
    /// - Parameters:
    ///   - activityItems: Items to share
    ///   - excludedActivityTypes: Activity types to exclude (optional)
    ///   - sourceView: Source view for popover (defaults to self.view)
    ///   - sourceRect: Source rect for popover (defaults to center of view)
    ///   - completion: Completion handler (optional)
    func presentActivityViewController(
        activityItems: [Any],
        excludedActivityTypes: [UIActivity.ActivityType]? = nil,
        sourceView: UIView? = nil,
        sourceRect: CGRect? = nil,
        completion: UIActivityViewController.CompletionWithItemsHandler? = nil
    ) {
        let activityVC = UIActivityViewController(activityItems: activityItems,
                                                  applicationActivities: nil)
        
        if let excludedTypes = excludedActivityTypes {
            activityVC.excludedActivityTypes = excludedTypes
        }
        
        if let completionHandler = completion {
            activityVC.completionWithItemsHandler = completionHandler
        }
        
        // Configure popover for iPad
        if let popover = activityVC.popoverPresentationController {
            let targetView = sourceView ?? self.view
            let targetRect = sourceRect ?? CGRect(
                x: self.view.bounds.midX,
                y: self.view.bounds.midY,
                width: 0,
                height: 0
            )
            
            popover.sourceView = targetView
            popover.sourceRect = targetRect
            popover.permittedArrowDirections = []
        }
        
        self.present(activityVC, animated: true, completion: nil)
    }

    func share(file: String) {
        guard let fileURL = URL(string: file) else {
            return
        }

        presentActivityViewController(
            activityItems: [fileURL],
            excludedActivityTypes: [.assignToContact, .addToReadingList]
        )
    }
}
