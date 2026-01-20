// swift-tools-version:5.10
import PackageDescription

#if os(Linux)
let dependencies: [Target.Dependency] = [.target(name: "CLibXML2")]
let clibs: [Target] = [.systemLibrary(
    name: "CLibXML2",
    pkgConfig: "libxml-2.0",
    providers: [.brew(["libxml2"]), .apt(["libxml2-dev"])]
)]
#else
let dependencies: [Target.Dependency] = []
let clibs: [Target] = []
#endif

let package = Package(
    name: "Fuzi",
    products: [
        .library(name: "Fuzi", targets: ["Fuzi"]),
    ],
    targets: clibs + [
        .target(name: "Fuzi", dependencies: dependencies),
        .testTarget(name: "FuziTests", dependencies: ["Fuzi"], path: "Tests")
    ]
)
