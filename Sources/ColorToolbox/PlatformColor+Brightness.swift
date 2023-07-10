//
//  PlatformColor+Brightness.swift
//  ColorToolbox
//
//  Created by Ramon Torres on 7/2/23.
//

import Foundation

extension PlatformColor {

    /// Returns a color that is lighter than the receiver by the given ratio.
    ///
    /// - Parameter ratio: The ratio to lighten the color by.
    /// - Returns: A lighter color.
    public func lightening(by ratio: CGFloat) -> PlatformColor {
        let calculate = { () -> PlatformColor in
            let components = self.toHSBComponents()
            let newBrightness = components.b != 0
                ? components.b + (components.b * ratio)
                : ratio

            return PlatformColor(
                hue: components.h,
                saturation: components.s,
                brightness: min(newBrightness, 1),
                alpha: components.a
            )
        }

        #if canImport(UIKit)
        return PlatformColor { _ in calculate() }
        #else
        return PlatformColor(name: nil) { _ in calculate() }
        #endif
    }

    /// Returns a color that is darker than the receiver by the given ratio.
    ///
    /// - Parameter ratio: The ratio to darken the color by.
    /// - Returns: A darker color.
    public func darkening(by ratio: CGFloat) -> PlatformColor {
        let calculate = { () -> PlatformColor in
            let components = self.toHSBComponents()
            let newBrightness = components.b != 1
                ? components.b - (components.b * ratio)
                : 1 - ratio

            return PlatformColor(
                hue: components.h,
                saturation: components.s,
                brightness: max(newBrightness, 0),
                alpha: components.a
            )
        }

        #if canImport(UIKit)
        return PlatformColor { _ in calculate() }
        #else
        return PlatformColor(name: nil) { _ in calculate() }
        #endif
    }

}
