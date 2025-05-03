import CWiringPi

func normalizeAddress(for adr: Pin.Address) -> Int32 {
	switch adr {
	case let .gpio(value):
		return value
	case let .physical(value):
		return value
	case let .wiringPi(value):
		return value
	}
}

func digitalWrite(value: Pin.Value, to pin: Pin.Address) {
	let address = normalizeAddress(for: pin)
	CWiringPi.digitalWrite(address, value.rawValue)
}

func digitalRead(from pin: Pin.Address) -> Pin.Value {
	let address = normalizeAddress(for: pin)
	let value = CWiringPi.digitalRead(address)
	return Pin.Value(rawValue: value)!
}

func pinMode(pin: Pin.Address, mode: Pin.Mode) {
	let address = normalizeAddress(for: pin)
	CWiringPi.pinMode(address, mode.rawValue)
}
