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

    func test_fromHex_shouldHandleColorsWithoutPoundSign() {
        XCTAssertEqual(PlatformColor(hex: "FF0000"), .init(red: 1, green: 0, blue: 0, alpha: 1))
    }

    func test_toHex() throws {
        XCTAssertEqual(PlatformColor.black.toHex(), "#000000")
        XCTAssertEqual(PlatformColor.white.toHex(), "#FFFFFF")
        XCTAssertEqual(PlatformColor.darkGray.toHex(), "#555555")
        XCTAssertEqual(PlatformColor(white: 0.752, alpha: 1).toHex(), "#C0C0C0")
        XCTAssertEqual(PlatformColor.red.toHex(), "#FF0000")
        XCTAssertEqual(PlatformColor.green.toHex(), "#00FF00")
        XCTAssertEqual(PlatformColor.blue.toHex(), "#0000FF")
    }

    func test_toHex_shouldIncludeAlphaWhenNeeded() throws {
        XCTAssertEqual(PlatformColor(white: 1, alpha: 0.5).toHex(), "#FFFFFF80")
        XCTAssertEqual(PlatformColor(white: 1, alpha: 0).toHex(), "#FFFFFF00")
    }

    func test_hex_convertingBackAndForth() throws {
        let webColors: [String] = [
            "#000000", "#C0C0C0", "#808080", "#FFFFFF", "#800000", "#FF0000", "#800080",
            "#FF00FF", "#008000", "#00FF00", "#808000", "#FFFF00", "#000080", "#0000FF",
            "#008080", "#00FFFF", "#F0F8FF", "#FAEBD7", "#00FFFF", "#7FFFD4", "#F0FFFF",
            "#F5F5DC", "#FFE4C4", "#000000", "#FFEBCD", "#0000FF", "#8A2BE2", "#A52A2A",
            "#DEB887", "#5F9EA0", "#7FFF00", "#D2691E", "#FF7F50", "#6495ED", "#FFF8DC",
            "#DC143C", "#00FFFF", "#00008B", "#008B8B", "#B8860B", "#A9A9A9", "#006400",
            "#A9A9A9", "#BDB76B", "#8B008B", "#556B2F", "#FF8C00", "#9932CC", "#8B0000",
            "#E9967A", "#8FBC8F", "#483D8B", "#2F4F4F", "#2F4F4F", "#00CED1", "#9400D3",
            "#FF1493", "#00BFFF", "#696969", "#696969", "#1E90FF", "#B22222", "#FFFAF0",
            "#228B22", "#FF00FF", "#DCDCDC", "#F8F8FF", "#FFD700", "#DAA520", "#808080",
            "#008000", "#ADFF2F", "#808080", "#F0FFF0", "#FF69B4", "#CD5C5C", "#4B0082",
            "#FFFFF0", "#F0E68C", "#E6E6FA", "#FFF0F5", "#7CFC00", "#FFFACD", "#ADD8E6",
            "#F08080", "#E0FFFF", "#FAFAD2", "#D3D3D3", "#90EE90", "#D3D3D3", "#FFB6C1",
            "#FFA07A", "#20B2AA", "#87CEFA", "#778899", "#778899", "#B0C4DE", "#FFFFE0",
            "#00FF00", "#32CD32", "#FAF0E6", "#FF00FF", "#800000", "#66CDAA", "#0000CD",
            "#BA55D3", "#9370DB", "#3CB371", "#7B68EE", "#00FA9A", "#48D1CC", "#C71585",
            "#191970", "#F5FFFA", "#FFE4E1", "#FFE4B5", "#FFDEAD", "#000080", "#FDF5E6",
            "#808000", "#6B8E23", "#FFA500", "#FF4500", "#DA70D6", "#EEE8AA", "#98FB98",
            "#AFEEEE", "#DB7093", "#FFEFD5", "#FFDAB9", "#CD853F", "#FFC0CB", "#DDA0DD",
            "#B0E0E6", "#800080", "#FF0000", "#BC8F8F", "#4169E1", "#8B4513", "#FA8072",
            "#F4A460", "#2E8B57", "#FFF5EE", "#A0522D", "#C0C0C0", "#87CEEB", "#6A5ACD",
            "#708090", "#708090", "#FFFAFA", "#00FF7F", "#4682B4", "#D2B48C", "#008080",
            "#D8BFD8", "#FF6347", "#40E0D0", "#EE82EE", "#F5DEB3", "#FFFFFF", "#F5F5F5",
            "#FFFF00", "#9ACD32"
        ]

        for hex in webColors {
            let color = try XCTUnwrap(PlatformColor(hex: hex))
            XCTAssertEqual(color.toHex(), hex)
        }
    }

}
