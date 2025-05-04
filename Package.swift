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
