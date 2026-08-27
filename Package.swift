// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-symmetry-dimension",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Symmetry Dimension",
            targets: ["Symmetry Dimension"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-symmetry.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-symmetry-algebra.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-dimension.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-numeric.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Symmetry Dimension",
            dependencies: [
                .product(name: "Symmetry", package: "swift-symmetry"),
                .product(name: "Symmetry Algebra", package: "swift-symmetry-algebra"),
                .product(name: "Dimension", package: "swift-dimension"),
                .product(name: "Real", package: "swift-numeric"),
            ]
        ),
        .testTarget(
            name: "Symmetry Dimension Tests",
            dependencies: [
                "Symmetry Dimension",
                .product(name: "Symmetry", package: "swift-symmetry"),
                .product(name: "Symmetry Algebra", package: "swift-symmetry-algebra"),
                .product(name: "Dimension", package: "swift-dimension"),
                .product(name: "Real", package: "swift-numeric"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
