import CWiringPi

public func digitalWrite(value: Pin.Value, to address: Pin.Address) {
	CWiringPi.digitalWrite(address, value.rawValue)
}

public func digitalRead(from address: Pin.Address) -> Pin.Value {
	let value = CWiringPi.digitalRead(address)
	return Pin.Value(rawValue: value)!
}

public func change(mode: Pin.Mode, for address: Pin.Address) {
	CWiringPi.pinMode(address, mode.rawValue)
}
