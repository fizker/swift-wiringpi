import CWiringPi

public enum AddressMode {
	case physical
	case gpio
	case wiringPi
}

public class Board {
	public let addressMode: AddressMode
	public init(addressMode: AddressMode) {
		self.addressMode = addressMode

		switch addressMode {
		case .gpio:
			wiringPiSetupGpio()
		case .physical:
			wiringPiSetupPhys()
		case .wiringPi:
			wiringPiSetup()
		}
	}

	func address(for adr: Int32) -> Pin.Address {
		switch addressMode {
		case .physical:
			return .physical(adr)
		case .gpio:
			return .gpio(adr)
		case .wiringPi:
			return .wiringPi(adr)
		}
	}

	public func pin(at address: Int32, mode: Pin.Mode) -> Pin {
		Pin(address: self.address(for: address), mode: mode)
	}
}
