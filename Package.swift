// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "postgres-kit",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "PostgresKit", targets: ["PostgresKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/postgres-nio.git", from: "1.0.0"),
        .package(url: "https://github.com/rnantes/sql-kit.git", branch: "all-encoding-strategies"),
        .package(url: "https://github.com/vapor/async-kit.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-atomics.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "PostgresKit", dependencies: [
            .product(name: "AsyncKit", package: "async-kit"),
            .product(name: "PostgresNIO", package: "postgres-nio"),
            .product(name: "SQLKit", package: "sql-kit"),
            .product(name: "Atomics", package: "swift-atomics")
        ]),
        .testTarget(name: "PostgresKitTests", dependencies: [
            .target(name: "PostgresKit"),
            .product(name: "SQLKitBenchmark", package: "sql-kit"),
        ]),
    ]
)
