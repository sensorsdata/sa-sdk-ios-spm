// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SensorsAnalyticsSDK",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "SensorsAnalyticsSDK",
            targets: ["SensorsAnalyticsSDK"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SensorsAnalyticsSDK",
            path: "SensorsAnalyticsSDK/SensorsAnalyticsSDK.xcframework"
        )
    ]
)
