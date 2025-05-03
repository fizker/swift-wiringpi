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
		.testTarget(
			name: "WiringPiTests",
			dependencies: ["WiringPi"],
		),
		.target(
			name: "CWiringPi",
			exclude: [
				"wiringPi/COPYING.LESSER",
				"wiringPi/Makefile",
				"wiringPi/noMoreStatic",
				"wiringPi/test",
			],
			sources: [
				"wiringPi",
			],
			publicHeadersPath: "wiringPi",
			cSettings: [
				.unsafeFlags(["-Wall"]),
			],
		)
	]
)
