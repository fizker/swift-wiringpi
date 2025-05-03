import Testing
@testable import WiringPi

@Test func example() async throws {
	print("bar returns \(bar())")
}

@Test func togglePin() async throws {
	let pin = Pin(address: .gpio(22), mode: .output)
	for _ in 0..<10 {
		print("toggling pin from \(pin.value)")
		pin.value.toggle()
		try await Task.sleep(for: .seconds(1))
	}
}
