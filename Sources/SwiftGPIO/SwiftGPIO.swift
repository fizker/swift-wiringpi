import ArgumentParser

struct SwiftGPIO: ParsableCommand {
	static let configuration = CommandConfiguration(subcommands: [
		ToggleCommand.self,
	])
}
