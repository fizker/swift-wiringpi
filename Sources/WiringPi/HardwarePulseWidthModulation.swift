import CWiringPi

enum HardwarePulseWidthModulation {
	public func write(toneFrequency: Int32, to pin: Pin.Address) {
		pwmToneWrite(pin, toneFrequency)
	}
	public func set(mode: Mode) {
		pwmSetMode(mode.rawValue)
	}
	public func set(range: UInt32) {
		pwmSetRange(range)
	}
	public func setClock(divisor: Int32) {
		pwmSetClock(divisor)
	}
	public func write(value: Int32, to pin: Pin.Address) {
		pwmWrite(pin, value)
	}

	enum Mode {
		case markSpace
		case balanced
	}
}

extension HardwarePulseWidthModulation.Mode: RawRepresentable {
	init?(rawValue: Int32) {
		switch rawValue {
		case PWM_MODE_MS: self = .markSpace
		case PWM_MODE_BAL: self = .balanced
		default: return nil
		}
	}

	var rawValue: Int32 {
		switch self {
		case .markSpace: PWM_MODE_MS
		case .balanced: PWM_MODE_BAL
		}
	}
}
