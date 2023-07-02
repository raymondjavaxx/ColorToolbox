//
//  PlatformColor+RelativeLuminance.swift
//  ColorToolbox
//
//  Created by Ramon Torres on 7/2/23.
//

import Foundation

extension PlatformColor {

    /// Relative luminance of the color.
    ///
    /// # Reference
    ///
    /// * [WCAG 2.2 specification](https://www.w3.org/TR/WCAG22/#dfn-relative-luminance)
    /// * [Wikipedia: Relative luminance](https://en.wikipedia.org/wiki/Relative_luminance)
    public var relativeLuminance: CGFloat {
        let components = self.toRGBAComponents()

        // Convert from sRGB to linear RGB
        let r = components.r < 0.04045 ? components.r / 12.92 : pow((components.r + 0.055) / 1.055, 2.4)
        let g = components.g < 0.04045 ? components.g / 12.92 : pow((components.g + 0.055) / 1.055, 2.4)
        let b = components.b < 0.04045 ? components.b / 12.92 : pow((components.b + 0.055) / 1.055, 2.4)

        // Calculate relative luminance (Y)
        let y = r * 0.2126 + g * 0.7152 + b * 0.0722

        return min(max(y, 0), 1)
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
    public func contrastRatio(to otherColor: PlatformColor) -> CGFloat {
        let luminance1 = self.relativeLuminance
        let luminance2 = otherColor.relativeLuminance
        return (max(luminance1, luminance2) + 0.05) / (min(luminance1, luminance2) + 0.05)
    }

}
