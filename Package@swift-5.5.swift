// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AF-TabBar",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "AFTabBar", targets: ["AFTabBar"])
    ],
    targets: [
        .target(name: "AFTabBar"),
    ]
)
