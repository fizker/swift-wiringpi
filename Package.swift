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
		),
		.testTarget(
			name: "WiringPiTests",
			dependencies: ["WiringPi"],
		),
	]
)
