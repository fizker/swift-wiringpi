import ArgumentParser
import WiringPi

struct Options: ParsableArguments {
	@Flag(
		name: [.customLong("use-bcm-gpio"), .customShort("g")],
		help: """
		Use the BCM_GPIO pins numbers rather than wiringPi pin numbers.
		Note: The BCM_GPIO pin numbers are always used with the export and edge commands.
		""",
	)
	var useGPIO: Bool = false
	@Flag(
		name: [.customLong("use-physical"), .customShort("1")],
		help: """
		Use the physical pin numbers rather than wiringPi pin numbers.
		Note: that this applies to the P1 connector  only. It is not possible to use pins on the Revision 2 P5 connector this way, and as with -g the BCM_GPIO pin numbers are always used with the export and edge commands.
		""",
	)
	var usePhysical: Bool = false

	var addressMode: AddressMode {
		if useGPIO {
			return .gpio
		} else if usePhysical {
			return .physical
		} else {
			return .wiringPi
		}
	}
}

struct ToggleCommand: AsyncParsableCommand {
	static let configuration = CommandConfiguration(
		commandName: "toggle",
		abstract: "Changes the state of a GPIO pin; 0 to 1, or 1 to 0.",
	)

	@OptionGroup
	var options: Options

	@Argument
	var pin: Int32

	func run() async throws {
		let board = Board(addressMode: options.addressMode)
		let pin = board.pin(at: pin, mode: .output)
		pin.value.toggle()
	}
}
