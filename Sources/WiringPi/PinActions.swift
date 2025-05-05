#if canImport(CWiringPi)
import CWiringPi
#endif
#if canImport(CWiringPiFake)
import CWiringPiFake
#endif

public func digitalWrite(value: Pin.Value, to address: Pin.Address) {
	digitalWrite(address, value.rawValue)
}

public func digitalRead(from address: Pin.Address) -> Pin.Value {
	let value = digitalRead(address)
	return Pin.Value(rawValue: value)!
}

public func change(mode: Pin.Mode, for address: Pin.Address) {
	pinMode(address, mode.rawValue)
}

public func change(pull: Pin.Pull, for address: Pin.Address) {
	pullUpDnControl(address, pull.rawValue)
}
