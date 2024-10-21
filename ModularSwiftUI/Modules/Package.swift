// swift-tools-version: 5.9

import PackageDescription

let main: [Target] = [
    .target(
        name: "Main",
        dependencies: [
            "CharacterList",
            "CharacterDetails",
            "Networking"
        ]
    )
]

let features: [Target] = [
    .target(
        name: "CharacterList",
        dependencies: [
            "NetworkingInterface",
            "Utilities",
            "Models",
        ],
        path: "Sources/Features/CharacterList"
    ),
    .target(
        name: "CharacterDetails",
        dependencies: [
            "Utilities",
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
        name: "Utilities",
        dependencies: [
            "Swinject",
            "Kingfisher",
        ]
    ),
]

let tests: [Target] = [
    .testTarget(
        name: "CharacterListTests",
        dependencies: ["CharacterList"]
    ),
]

let thirdPartyDependencies: [Package.Dependency] = [
    .package(
        url: "https://github.com/Swinject/Swinject.git",
        from: "2.0.0"
    ),
    .package(
        url: "https://github.com/onevcat/Kingfisher.git",
        from: "7.0.0"
    ),
]

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Modules",
            targets: ["Main"]
        ),
    ],
    dependencies: thirdPartyDependencies,
    targets:
        main +
        features +
        common +
        tests
)
