//
//  Color+ColorToolbox.swift
//  ColorToolbox
//
//  Copyright (c) 2023 Ramon Torres
//
//  This file is part of ColorToolbox which is released under the MIT license.
//  See the LICENSE file in the root directory of this source tree for full details.
//

#if canImport(SwiftUI)
import SwiftUI

extension Color {

    /// Relative luminance of the color.
    ///
    /// # Reference
    ///
    /// * [WCAG 2.2 specification](https://www.w3.org/TR/WCAG22/#dfn-relative-luminance)
    /// * [Wikipedia: Relative luminance](https://en.wikipedia.org/wiki/Relative_luminance)
    public var relativeLuminance: CGFloat {
        PlatformColor(self).relativeLuminance
    }

    /// Creates a color from a hex string.
    ///
    /// - Parameter hex: Hex string.
    public init?(hex: String) {
        guard let color = PlatformColor(hex: hex) else {
            return nil
        }

        self.init(color)
    }

    /// Returns the hex color representation of the color.
    ///
    /// - Returns: Hex string.
    public func toHex() -> String {
        return PlatformColor(self).toHex()
    }

    /// Calculates the contrast ratio between two colors according to
    /// the Web Content Accessibility Guidelines (WCAG) 2.2.
    ///
    /// # Reference
    ///
    /// * [WCAG 2.2](https://www.w3.org/TR/WCAG22/#dfn-contrast-ratio)
    ///
    /// - Parameter otherColor: The other color to compare with.
    /// - Returns: The contrast ratio.
    public func contrastRatio(to otherColor: Color) -> CGFloat {
        return PlatformColor(self).contrastRatio(to: PlatformColor(otherColor))
    }

    /// Returns a color that is lighter than the receiver by the given ratio.
    ///
    /// - Parameter ratio: The ratio to lighten the color by.
    /// - Returns: A lighter color.
    public func lightening(by ratio: CGFloat) -> Color {
        return Color(
            PlatformColor(self).lightening(by: ratio)
        )
    }

    /// Returns a color that is darker than the receiver by the given ratio.
    ///
    /// - Parameter ratio: The ratio to darken the color by.
    /// - Returns: A darker color.
    public func darkening(by ratio: CGFloat) -> Color {
        return Color(
            PlatformColor(self).darkening(by: ratio)
        )
    }

}
#endif
