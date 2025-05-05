import CWiringPi

public enum AddressMode {
	case physical
	case gpio
	case wiringPi
}

public func setupBoard(addressMode: AddressMode) {
	switch addressMode {
	case .gpio:
		wiringPiSetupGpio()
	case .physical:
		wiringPiSetupPhys()
	case .wiringPi:
		wiringPiSetup()
	}
}
