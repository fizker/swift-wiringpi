import ArgumentParser

@main
struct SwiftGPIO: AsyncParsableCommand {
	static let configuration = CommandConfiguration(subcommands: [
		ToggleCommand.self,
	])
}
