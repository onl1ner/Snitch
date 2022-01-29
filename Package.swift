// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Snitch",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "Snitch",
            targets: ["Snitch"]
        ),
    ],
    targets: [
        .target(
            name: "Snitch",
            dependencies: []
        )
    ]
)
