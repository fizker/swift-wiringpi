// swift-tools-version: 6.1

import PackageDescription

let package = Package(
	name: "swift-wiringpi",
	products: [
		.library(
			name: "WiringPi",
			targets: ["WiringPi"],
		),
	],
	targets: [
		.target(
			name: "WiringPi",
			dependencies: [
				"CWiringPi",
			],
		),
		.target(
			name: "CWiringPi",
			dependencies: [
				.targetItem(name: "CWiringPiReal", condition: .when(platforms: [ .linux ])),
				.targetItem(name: "CWiringPiFake", condition: .when(platforms: [ .macOS ])),
			],
			path: "Sources/CWiringPiUmbrella",
		),
		.systemLibrary(
			name: "CWiringPiReal",
			path: "Sources/CWiringPi",
			pkgConfig: "wiringpi",
			providers: [
				.apt(["wiringpi"]),
			],
		),
		.target(
			name: "CWiringPiFake",
			sources: [
				"wiringPi.c",
				"wiringPiI2C.c",
			],
			publicHeadersPath: "WiringPi/wiringPi",
		),
		.testTarget(
			name: "WiringPiTests",
			dependencies: ["WiringPi"],
		),
	]
)
