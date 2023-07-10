# ColorToolbox

Swift color utilities for UIKit, AppKit and SwiftUI.

## Installation
## Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/raymondjavaxx/ColorToolbox.git", from: "1.0.0")
```

## CocoaPods

Add the following line to your `Podfile`:

```ruby
pod 'ColorToolbox', '~> 1.0'
```

## Usage

ColorToolbox is implemented as a set of extensions on `UIColor`, `NSColor` and `Color` (SwiftUI). The following examples use `UIColor`, but the same utilities are available on all platforms.

### Converting from and to hex string

To create a color from a hex string, use the `init(hex:)` initializer:

```swift
import ColorToolbox

let color = UIColor(hex: "#ff0000")
```

To convert a color to a hex string, use the `toHex()` method:

```swift
let hexString = color.toHex()
```

### Calculating the relative luminance

```swift
let color: UIColor = .red
print(color.relativeLuminance) // 0.2126
```

### Calculating WCAG contrast ratio

```swift
let color1 = ...
let color2 = ...

let contrastRatio = color1.contrastRatio(to: color2)
```

### Lightening and darkening colors

```swift
let lighterColor = color.lightening(by: 0.2)
let darkerColor = color.darkening(by: 0.2)
```

## License

ColorToolbox is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
