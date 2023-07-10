//
//  PlatformRelativeLuminanceTests.swift
//  ColorToolboxTests  
//
//  Copyright (c) 2023 Ramon Torres
//
//  This file is part of ColorToolbox which is released under the MIT license.
//  See the LICENSE file in the root directory of this source tree for full details.
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

    func test_contrastRatio() throws {
        // High contrast
        XCTAssertEqual(PlatformColor.white.contrastRatio(to: .black), 21)
        XCTAssertEqual(PlatformColor.black.contrastRatio(to: .white), 21)

        // Identical colors
        XCTAssertEqual(PlatformColor.white.contrastRatio(to: .white), 1)
        XCTAssertEqual(PlatformColor.black.contrastRatio(to: .black), 1)

        // Black to 50% gray
        XCTAssertEqual(
            PlatformColor.black.contrastRatio(to: PlatformColor(white: 0.5, alpha: 1)),
            5.28,
            accuracy: 0.01
        )
    }

}
