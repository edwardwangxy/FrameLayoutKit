// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FrameLayoutKit",
	platforms: [.iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "FrameLayoutKit",
            targets: ["FrameLayoutKit"]),
    ],
    targets: [
        .target(
            name: "FrameLayoutKit",
			path: "FrameLayoutKit/Classes"),
        .testTarget(
            name: "FrameLayoutKitTests",
            dependencies: ["FrameLayoutKit"])
    ],
	swiftLanguageModes: [.v6]
)
