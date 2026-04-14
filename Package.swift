// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterPHP",
    products: [
        .library(name: "TreeSitterPHP", targets: ["TreeSitterPHP"]),
    ],
    dependencies: [
        .package(name: "SwiftTreeSitter", url: "https://github.com/tree-sitter/swift-tree-sitter", from: "0.9.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterPHP",
            dependencies: [],
            path: ".",
            sources: [
                "php/src/parser.c",
                "php/src/scanner.c",
                "php_only/src/parser.c",
                "php_only/src/scanner.c",
            ],
            resources: [
                .copy("queries"),
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [
                .headerSearchPath("php/src"),
                .headerSearchPath("php_only/src"),
            ],
        ),
        .testTarget(
            name: "TreeSitterPHPTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterPHP",
            ],
            path: "bindings/swift/TreeSitterPHPTests",
        ),
    ],
    cLanguageStandard: .c11,
)
