// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "ColorToolbox",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11),
        .watchOS(.v7)
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
