// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ColorToolbox",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .visionOS(.v1),
        .macCatalyst(.v13),
    ],
    products: [
        .library(
            name: "ColorToolbox",
            targets: ["ColorToolbox"]
        )
    ],
    targets: [
        .target(
            name: "ColorToolbox"
        ),
        .testTarget(
            name: "ColorToolboxTests",
            dependencies: ["ColorToolbox"]
        )
    ]
)
