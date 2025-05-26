// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

//  GitHub
//  https://github.com/jessesquires/mariposa
//
//  Copyright © 2025 Jesse Squires
//  https://www.jessesquires.com
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
