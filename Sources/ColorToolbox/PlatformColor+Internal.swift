//
//  PlatformColor+Internal.swift
//  ColorToolbox
//
//  Copyright (c) 2023 Ramon Torres
//
//  This file is part of ColorToolbox which is released under the MIT license.
//  See the LICENSE file in the root directory of this source tree for full details.
//

import Foundation

extension PlatformColor {
    struct RGBAComponents {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
    }

    struct HSBComponents {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
    }

    func toRGBAComponents() -> RGBAComponents {
        var components = RGBAComponents()

        #if canImport(UIKit)
        let result = self.getRed(
            &components.r,
            green: &components.g,
            blue: &components.b,
            alpha: &components.a
        )
        assert(result, "Failed to get RGBA components from UIColor")
        #else
        if let rgbColor = self.usingColorSpace(.sRGB) {
            rgbColor.getRed(
                &components.r,
                green: &components.g,
                blue: &components.b,
                alpha: &components.a
            )
        } else {
            assertionFailure("Failed to convert color space")
        }
        #endif

        return components
    }

    func toHSBComponents() -> HSBComponents {
        var components = HSBComponents()

        #if canImport(UIKit)
        let result = self.getHue(
            &components.h,
            saturation: &components.s,
            brightness: &components.b,
            alpha: &components.a
        )
        assert(result, "Failed to get HSB components from UIColor")
        #else
        if let rgbColor = self.usingColorSpace(.sRGB) {
            rgbColor.getHue(
                &components.h,
                saturation: &components.s,
                brightness: &components.b,
                alpha: &components.a
            )
        } else {
            assertionFailure("Failed to convert color space")
        }
        #endif

        return components
    }

    static func dynamicColor(_ block: @escaping () -> PlatformColor) -> PlatformColor {
        #if canImport(UIKit)
        #if os(watchOS)
        // watchOS doesn't support dynamic color providers. We simply invoke
        // the block and return the transformed color.
        return block()
        #else
        // iOS, iPadOS, Mac Catalyst, and tvOS
        return PlatformColor { _ in block() }
        #endif
        #else
        // macOS
        return PlatformColor(name: nil) { _ in block() }
        #endif
    }

}
