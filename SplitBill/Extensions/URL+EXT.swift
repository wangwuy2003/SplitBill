//
//  URL+EXT.swift
//  AINoteTaker
//
//  Created by đào sơn on 13/4/25.
//

import Foundation
import PDFKit

extension URL {
    func extractOriginalName() -> String? {
        let fileName = self.deletingPathExtension().lastPathComponent
        let fileExtension = self.pathExtension

        if let range = fileName.range(of: "_[A-F0-9\\-]+$", options: .regularExpression) {
            let baseName = String(fileName[..<range.lowerBound])
            return baseName + "." + fileExtension
        }

        return nil
    }


    func extractText() -> String? {
        guard let pdfDocument = PDFDocument(url: self) else {
            return nil
        }

        var fullText = ""

        for pageIndex in 0..<pdfDocument.pageCount {
            guard let page = pdfDocument.page(at: pageIndex),
                  let pageText = page.string else { continue }
            fullText += pageText + "\n\n"
        }

        return fullText
    }
}
