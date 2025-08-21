//
//  TimeInterval+Exts.swift
//  AINoteTaker
//
//  Created by đào sơn on 26/3/25.
//

import Foundation

extension TimeInterval {
    func timeFormat() -> String {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad

        if self >= 3600 {
            formatter.allowedUnits = [.hour, .minute, .second]
        } else {
            formatter.allowedUnits = [.minute, .second]
        }

        return formatter.string(from: self) ?? "00:00"
    }
}
