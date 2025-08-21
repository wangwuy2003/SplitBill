//
//  String+Exts.swift
//  AINoteTaker
//
//  Created by Luong Manh on 11/3/25.
//

import Foundation

extension String {
    func clipped(maxCharacters: Int) -> String {
        String(prefix(maxCharacters))
    }
    
    func replaceSpacesWithUnderscores() -> String {
        self.replacingOccurrences(of: " ", with: "_")
    }

    var localized: String {
        let localizedText = NSLocalizedString(self, bundle: Bundle.main, comment: "")
        return localizedText.isEmpty ? self : localizedText
    }
}

// MARK: - FileManager
extension String {
    var relativePath: String {
        let documentDir = FileManager.default.urls(for: .documentDirectory,
                                                   in: .userDomainMask).first!
        return self.replacingOccurrences(of: documentDir.absoluteString, with: "")
    }

    var absolutePath: String {
        let documentDir = FileManager.default.urls(for: .documentDirectory,
                                                   in: .userDomainMask).first!
        
        if self.contains(documentDir.absoluteString) {
            return self
        } else {
            return documentDir.absoluteString + self
        }
    }
}
