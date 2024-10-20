// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let features: [Target] = [
    .target(
        name: "CharacterList",
        dependencies: [
            "Kingfisher",
            "NetworkingInterface",
            "Utilities",
            "Models",
        ],
        path: "Sources/Features/CharacterList"
    ),
    .target(
        name: "CharacterDetails",
        dependencies: [
            "Kingfisher",
            "Models",
        ],
        path: "Sources/Features/CharacterDetails"
    ),
]

let common: [Target] = [
    .target(
        name: "Models"
    ),
    .target(
        name: "Networking",
        dependencies: ["NetworkingInterface"]
    ),
    .target(
        name: "NetworkingInterface"
    ),
    .target(
        name: "Utilities"
    ),
]

let tests: [Target] = [
    .testTarget(
        name: "CharacterListTests",
        dependencies: ["CharacterList"]
    ),
]

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Modules",
            targets: [
                "CharacterList",
                "CharacterDetails",
                "Models",
                "Networking",
                "NetworkingInterface",
                "Utilities",
            ]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/onevcat/Kingfisher.git",
            from: "7.0.0"
        ),
    ],
    targets:
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        features +
        common +
        tests
)

