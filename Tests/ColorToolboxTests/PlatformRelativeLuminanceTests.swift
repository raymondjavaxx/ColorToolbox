//
//  PlatformRelativeLuminanceTests.swift
//  ColorToolboxTests
//
//  Created by Ramon Torres on 7/2/23.
//

import XCTest
import ColorToolbox

final class PlatformRelativeLuminanceTests: XCTestCase {

    func test_relativeLuminance() throws {
        let testCases: [(PlatformColor, CGFloat)] = [
            // Grays
            (PlatformColor(white: 0, alpha: 1), 0.0),
            (PlatformColor(white: 0.25, alpha: 1), 0.05),
            (PlatformColor(white: 0.5, alpha: 1), 0.21),
            (PlatformColor(white: 0.75, alpha: 1), 0.52),
            (PlatformColor(white: 1, alpha: 1), 1.0),
            // Colors (Extract Rec. 709 coefficients)
            (PlatformColor(red: 1, green: 0, blue: 0, alpha: 1), 0.2126),
            (PlatformColor(red: 0, green: 1, blue: 0, alpha: 1), 0.7152),
            (PlatformColor(red: 0, green: 0, blue: 1, alpha: 1), 0.0722)
        ]

        for (color, expectedRelativeLuminance) in testCases {
            XCTAssertEqual(color.relativeLuminance, expectedRelativeLuminance, accuracy: 0.01)
        }
    }

}
