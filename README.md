# ColorToolbox

Swift color utilities.

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
