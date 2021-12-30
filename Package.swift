// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Snitch",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
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
