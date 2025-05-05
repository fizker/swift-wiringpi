import CWiringPi

public enum HardwarePulseWidthModulation {
	public static func write(toneFrequency: Int32, to pin: Pin.Address) {
		pwmToneWrite(pin, toneFrequency)
	}
	public static func set(mode: Mode) {
		pwmSetMode(mode.rawValue)
	}
	public static func set(range: UInt32) {
		pwmSetRange(range)
	}
	public static func setClock(divisor: Int32) {
		pwmSetClock(divisor)
	}
	public static func write(value: Int32, to pin: Pin.Address) {
		pwmWrite(pin, value)
	}

	public enum Mode {
		case markSpace
		case balanced
	}
}

extension HardwarePulseWidthModulation.Mode {
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
