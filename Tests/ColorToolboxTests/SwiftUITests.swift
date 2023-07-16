//
//  SwiftUITests.swift
//  ColorToolboxTests
//
//  Copyright (c) 2023 Ramon Torres
//
//  This file is part of ColorToolbox which is released under the MIT license.
//  See the LICENSE file in the root directory of this source tree for full details.
//

import XCTest
import SwiftUI
import ColorToolbox

final class SwiftUITests: XCTestCase {

    func test_fromHex() {
        let result = Color(hex: "#FF0000")
        XCTAssertEqual(
            result,
            Color(PlatformColor(red: 1, green: 0, blue: 0, alpha: 1))
        )
    }

    func test_toHex() {
        XCTAssertEqual(Color(.white).toHex(), "#FFFFFF")
        XCTAssertEqual(Color(.black).toHex(), "#000000")
        XCTAssertEqual(Color(.red).toHex(), "#FF0000")
    }

    func test_relativeLuminance() {
        XCTAssertEqual(Color(.red).relativeLuminance, 0.2126, accuracy: 0.01)
    }

    func test_contrastRatio() throws {
        XCTAssertEqual(Color.white.contrastRatio(to: .black), 21, accuracy: 0.01)
    }

}
