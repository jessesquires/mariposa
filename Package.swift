// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

//
//  Created by Jesse Squires.
//  https://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/mariposa
//
//  Copyright © 2025-present Jesse Squires
//

import PackageDescription

let package = Package(
    name: "Mariposa",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "mariposa", targets: ["Mariposa"])
    ],
    targets: [
        .executableTarget(
            name: "Mariposa",
            path: "Sources"
        )
    ],
    swiftLanguageModes: [.v6]
)
