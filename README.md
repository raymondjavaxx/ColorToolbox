# ColorToolbox

Swift color utilities.

## Usage

### Converting from and to hex string

```swift
import ColorToolbox

// From hex string
let color = UIColor(hex: "#ff0000") // Or NSColor(hex: "#ff0000") on macOS

// To hex string
let hexString = color.toHex()
```

### Calculating the relative luminance

```swift
let color = UIColor.red // Or NSColor.red on macOS
print(color.relativeLuminance) // 0.2126
```

### Calculating WCAG contrast ratio

```swift
let color1 = ...
let color2 = ...

let contrastRatio = color1.contrastRatio(to: color2)
```
