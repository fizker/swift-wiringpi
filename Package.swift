// swift-tools-version: 6.1

import PackageDescription

let package = Package(
	name: "swift-wiringpi",
	products: [
		.library(
			name: "WiringPi",
			targets: ["WiringPi"],
		),
		.executable(
			name: "swift-gpio",
			targets: ["SwiftGPIO"],
		),
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"),
	],
	targets: [
		.executableTarget(
			name: "SwiftGPIO",
			dependencies: [
				"WiringPi",
				.product(name: "ArgumentParser", package: "swift-argument-parser"),
			],
		),
		.target(
			name: "WiringPi",
			dependencies: [
				"CWiringPi",
			]
		),
		.systemLibrary(
			name: "CWiringPi",
			pkgConfig: "wiringpi",
			providers: [
				.apt(["wiringpi"]),
			],
		),
		.testTarget(
			name: "WiringPiTests",
			dependencies: ["WiringPi"],
		),
	]
)
