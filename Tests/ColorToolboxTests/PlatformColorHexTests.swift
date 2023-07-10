//
//  PlatformColorHexTests.swift
//  ColorToolboxTests  
//
//  Copyright (c) 2023 Ramon Torres
//
//  This file is part of ColorToolbox which is released under the MIT license.
//  See the LICENSE file in the root directory of this source tree for full details.
//

import XCTest
import ColorToolbox

final class PlatformColorHexTests: XCTestCase {

    func test_fromHex() throws {
        XCTAssertEqual(PlatformColor(hex: "#000000"), .init(red: 0, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(PlatformColor(hex: "#FFFFFF"), .init(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertEqual(PlatformColor(hex: "#FF0000"), .init(red: 1, green: 0, blue: 0, alpha: 1))
    }

    func test_toHex() throws {
        XCTAssertEqual(PlatformColor.black.toHex(), "#000000")
        XCTAssertEqual(PlatformColor.white.toHex(), "#FFFFFF")
        XCTAssertEqual(PlatformColor.darkGray.toHex(), "#555555")
        XCTAssertEqual(PlatformColor.red.toHex(), "#FF0000")
        XCTAssertEqual(PlatformColor.green.toHex(), "#00FF00")
        XCTAssertEqual(PlatformColor.blue.toHex(), "#0000FF")
    }

}
