// swift-tools-version:5.10.0

import PackageDescription
import Foundation

let package = Package(
    name: "SwiftAPI",
    platforms: [
        .iOS("13.0"),
        .macOS("13.0"),
        .tvOS("13.0"),
        .watchOS("6.0")
    ],
    products: [
        .library(
            name: "SwiftAPI",
            targets: ["SwiftAPI_PrecompiledProduct"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-precompiled/Merge",
            branch: "master"
        ),
        .package(
            url: "https://github.com/swift-precompiled/Swallow",
            branch: "master"
        )
    ],
    targets: [
        .target(
            name: "SwiftAPI_Aggregation",
            dependencies: ["SwiftAPI"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "SwiftAPI",
            url: "https://github.com/swift-precompiled/SwiftAPI/releases/download/master-252131cf3b5e4e95cb3e8ed6e2b356b3b49e566c/SwiftAPI-26c2b02499dad8b3bc5075ac85b100aa1fd22ddefc1c1833306dd21c45ca6217.xcframework.zip",
            checksum: "26c2b02499dad8b3bc5075ac85b100aa1fd22ddefc1c1833306dd21c45ca6217"
        ),
        .target(
            name: "SwiftAPI_PrecompiledProduct",
            dependencies: [
                "SwiftAPI_Aggregation",
                .product(
                    name: "Merge",
                    package: "Merge"
                ),
                .product(
                    name: "Swallow",
                    package: "Swallow"
                )
            ]
        )
    ]
)