//
//  PlatformColor+Hex.swift
//  ColorToolbox
//
//  Copyright (c) 2023 Ramon Torres
//
//  This file is part of ColorToolbox which is released under the MIT license.
//  See the LICENSE file in the root directory of this source tree for full details.
//

import Foundation

extension PlatformColor {

    /// Creates a color from a hex string.
    ///
    /// - Parameter hex: Hex string.
    public convenience init?(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.charactersToBeSkipped = nil

        // Consume optional `#`
        _ = scanner.scanString("#")

        switch scanner.charactersLeft() {
        case 6, 8:
            guard let red = scanner.scanHexByte(),
                  let green = scanner.scanHexByte(),
                  let blue = scanner.scanHexByte() else {
                return nil
            }

            var alpha: UInt8 = 255

            // Parse alpha if available
            if scanner.charactersLeft() == 2 {
                guard let parsedAlpha = scanner.scanHexByte() else {
                    return nil
                }

                alpha = parsedAlpha
            }

            self.init(
                red: CGFloat(red) / 255,
                green: CGFloat(green) / 255,
                blue: CGFloat(blue) / 255,
                alpha: CGFloat(alpha) / 255
            )
        case 3:
            guard let red = scanner.scanHexNibble(),
                  let green = scanner.scanHexNibble(),
                  let blue = scanner.scanHexNibble() else {
                return nil
            }

            self.init(
                red: CGFloat(red) / 15,
                green: CGFloat(green) / 15,
                blue: CGFloat(blue) / 15,
                alpha: 1
            )
        default:
            return nil
        }
    }

    /// Returns the hex color representation of the color.
    ///
    /// - Returns: Hex string.
    public func toHex() -> String {
        var components = self.toRGBAComponents()

        // Clamp components to [0.0, 1.0]
        components.r = max(0, min(1, components.r))
        components.g = max(0, min(1, components.g))
        components.b = max(0, min(1, components.b))
        components.a = max(0, min(1, components.a))

        if components.a == 1 {
            // RGB
            return String(
                format: "#%02lX%02lX%02lX",
                Int(round(components.r * 255)),
                Int(round(components.g * 255)),
                Int(round(components.b * 255))
            )
        } else {
            // RGBA
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(round(components.r * 255)),
                Int(round(components.g * 255)),
                Int(round(components.b * 255)),
                Int(round(components.a * 255))
            )
        }
    }

}

private extension Scanner {

    func scanHexNibble() -> UInt8? {
        guard let character = scanCharacter(), character.isHexDigit else {
            return nil
        }

        return UInt8(String(character), radix: 16)
    }

    func scanHexByte() -> UInt8? {
        guard let highNibble = scanHexNibble(), let lowNibble = scanHexNibble() else {
            return nil
        }

        return (highNibble << 4) | lowNibble
    }

    func charactersLeft() -> Int {
        return string.count - currentIndex.utf16Offset(in: string)
    }

}
