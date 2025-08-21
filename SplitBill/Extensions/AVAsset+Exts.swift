//
//  AVAsset+Exts.swift
//  AINoteTaker
//
//  Created by đào sơn on 26/3/25.
//

import Foundation
import AVFoundation

extension AVAsset {
    func extractAudioLevels(barCount: Int = 30) -> [CGFloat] {
        guard let assetTrack = self.tracks(withMediaType: .audio).first else { return [] }

        let assetReader = try? AVAssetReader(asset: self)
        let outputSettings: [String: Any] = [
            AVFormatIDKey: kAudioFormatLinearPCM,
            AVLinearPCMBitDepthKey: 16,
            AVLinearPCMIsBigEndianKey: false,
            AVLinearPCMIsFloatKey: false,
            AVLinearPCMIsNonInterleaved: false
        ]

        let output = AVAssetReaderTrackOutput(track: assetTrack, outputSettings: outputSettings)
        assetReader?.add(output)
        assetReader?.startReading()

        var sampleData: [CGFloat] = []

        while let sampleBuffer = output.copyNextSampleBuffer(),
              let blockBuffer = CMSampleBufferGetDataBuffer(sampleBuffer) {
            var length = 0
            var dataPointer: UnsafeMutablePointer<Int8>?
            CMBlockBufferGetDataPointer(blockBuffer,
                                        atOffset: 0,
                                        lengthAtOffsetOut: &length,
                                        totalLengthOut: nil,
                                        dataPointerOut: &dataPointer)

            if let dataPointer = dataPointer {
                for i in stride(from: 0, to: length - 1, by: 2) {
                    let lowByte = UInt8(bitPattern: dataPointer[i])
                    let highByte = UInt8(bitPattern: dataPointer[i + 1])
                    let combined = UInt16(lowByte) | (UInt16(highByte) << 8)
                    let sample = Int16(bitPattern: combined)
                    let level = CGFloat(abs(Int32(sample))) / 32767.0
                    sampleData.append(level)
                }
            }
        }

        // Seperate data into `barCount` equal part
        let step = max(1, sampleData.count / barCount)
        var levels: [CGFloat] = []
        for i in stride(from: 0, to: sampleData.count, by: step) {
            let chunk = sampleData[i..<min(i + step, sampleData.count)]
            levels.append(chunk.max() ?? 0.1) // Get max value in range
        }

        return levels
    }
}
