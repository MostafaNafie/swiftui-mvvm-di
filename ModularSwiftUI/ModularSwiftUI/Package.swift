// swift-tools-version: 5.9

import PackageDescription

let main: [Target] = [
    .target(
        name: "Main",
        dependencies: [
            "CharacterList",
            "CharacterDetails"
        ]
    )
]

let features: [Target] = [
    .target(
        name: "CharacterList",
        dependencies: [
            "Common",
        ],
        path: "Sources/Features/CharacterList"
    ),
    .target(
        name: "CharacterDetails",
        dependencies: [
            "Common",
        ],
        path: "Sources/Features/CharacterDetails"
    ),
]

let common: [Target] = [
    .target(
        name: "Common",
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
    name: "ModularSwiftUI",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ModularSwiftUI",
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
