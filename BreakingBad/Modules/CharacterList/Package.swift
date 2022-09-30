// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CharacterList",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CharacterList",
            targets: ["CharacterList"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0"
        ),
        .package(
            url: "https://github.com/Swinject/Swinject.git", from: "2.0.0"
        ),
        .package(path: "../../Common/Network/NetworkingInterface"),
        .package(path: "../../Common/Utilities")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CharacterList",
            dependencies: ["Kingfisher", "NetworkingInterface", "Utilities"]),
        .testTarget(
            name: "CharacterListTests",
            dependencies: ["CharacterList"]),
    ]
)
