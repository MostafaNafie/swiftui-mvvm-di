// swift-tools-version: 6.0

import PackageDescription

let main: [Target] = [
    .target(
        name: "Main",
        dependencies: [
            "SharedCharacterData",
        ]
    )
]

let shared: [Target] = [
    .target(
        name: "SharedCharacterData",
        dependencies: [
            "CharacterList",
            "CharacterDetails",
        ],
        path: "Sources/Shared/SharedCharacterData"
    ),
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
            "Factory",
            "Kingfisher",
        ]
    ),
]

let tests: [Target] = [
    .testTarget(
        name: "CharacterListTests",
        dependencies: [
            "SharedCharacterData",
            "CharacterList",
        ]
    ),
]

let thirdPartyDependencies: [Package.Dependency] = [
    .package(
        url: "https://github.com/hmlongco/Factory.git",
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
        shared +
        features +
        common +
        tests
)
