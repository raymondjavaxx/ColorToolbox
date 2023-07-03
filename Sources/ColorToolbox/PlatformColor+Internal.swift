//
//  PlatformColor+Internal.swift
//  ColorToolbox
//
//  Created by Ramon Torres on 7/2/23.
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
        #elseif canImport(AppKit)
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
        #elseif canImport(AppKit)
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

}
