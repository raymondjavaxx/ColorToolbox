//
//  PlatformColorBrightnessTests.swift
//  ColorToolboxTests  
//
//  Copyright (c) 2023 Ramon Torres
//
//  This file is part of ColorToolbox which is released under the MIT license.
//  See the LICENSE file in the root directory of this source tree for full details.
//

import XCTest
import ColorToolbox

final class PlatformColorBrightnessTests: XCTestCase {

    func test_lightening() {
        let sut = PlatformColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        let lightenedColor = sut.lightening(by: 0.5)
        XCTAssertEqual(lightenedColor.cgColor.components, [0.75, 0.75, 0.75, 1])
    }

    func test_lightening_shouldNotExceedMaxBrightness() {
        let sut = PlatformColor(red: 1, green: 1, blue: 1, alpha: 1)
        let lightenedColor = sut.lightening(by: 0.5)
        XCTAssertEqual(lightenedColor.cgColor.components, [1, 1, 1, 1])
    }

    func test_darkening() {
        let sut = PlatformColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        let darkenedColor = sut.darkening(by: 0.5)
        XCTAssertEqual(darkenedColor.cgColor.components, [0.25, 0.25, 0.25, 1])
    }

    func test_darkening_shouldNotExceedMinBrightness() {
        let sut = PlatformColor(red: 0, green: 0, blue: 0, alpha: 1)
        let darkenedColor = sut.darkening(by: 0.5)
        XCTAssertEqual(darkenedColor.cgColor.components, [0, 0, 0, 1])
    }

}
