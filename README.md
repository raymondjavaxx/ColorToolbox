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

### Converting from and to hex string

```swift
import ColorToolbox

// UIKit
let color = UIColor(hex: "#ff0000")

// AppKit
let color = NSColor(hex: "#ff0000")

// SwiftUI
let color = Color(hex: "#ff0000")

// To hex string
let hexString = color.toHex()
```

### Calculating the relative luminance

```swift
let color = ...red
print(color.relativeLuminance) // 0.2126
```

### Calculating WCAG contrast ratio

```swift
let color1 = ...
let color2 = ...

let contrastRatio = color1.contrastRatio(to: color2)
```


## License

ColorToolbox is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
