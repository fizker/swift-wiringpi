import CWiringPi

public class Pin {
	public init(address: Address, mode: Mode) {
		self.address = address

		value = digitalRead(from: address)
		self.mode = mode

		pinMode(pin: address, mode: mode)
	}

	public let address: Address

	public var value: Value = .low {
		didSet {
			digitalWrite(value: value, to: address)
		}
	}

	public var mode: Mode {
		didSet {
			pinMode(pin: address, mode: mode)
		}
	}

	public enum Address {
		case physical(Int32)
		case gpio(Int32)
		case wiringPi(Int32)
	}

	public enum Value {
		case low
		case high

		var toggled: Self {
			switch self {
			case .high: .low
			case .low: .high
			}
		}

		mutating func toggle() {
			self = toggled
		}
	}

	public enum Mode {
		case input
		case output
		case pwmOutput
		case pwmMSOutput
		case pwmBALOutput
		case gpioClock
		case softwarePWMOutput
		case softwareToneOutput
		case pwmToneOutput
		case off
	}
}

extension Pin.Value: RawRepresentable {
	public init?(rawValue: Int32) {
		switch rawValue {
		case HIGH: self = .high
		case LOW: self = .low
		default: return nil
		}
	}

	public var rawValue: Int32 {
		switch self {
		case .high: HIGH
		case .low: LOW
		}
	}
}

extension Pin.Mode: RawRepresentable {
	public init?(rawValue: Int32) {
		switch rawValue {
		case INPUT: self = .input
		case OUTPUT: self = .output
		case PWM_OUTPUT: self = .pwmOutput
		case PWM_MS_OUTPUT: self = .pwmMSOutput
		case PWM_BAL_OUTPUT: self = .pwmBALOutput
		case GPIO_CLOCK: self = .gpioClock
		case SOFT_PWM_OUTPUT: self = .softwarePWMOutput
		case SOFT_TONE_OUTPUT: self = .softwareToneOutput
		case PWM_TONE_OUTPUT: self = .pwmToneOutput
		case PM_OFF: self = .off
		default: return nil
		}
	}

	public var rawValue: Int32 {
		switch self {
		case .input: INPUT
		case .output: OUTPUT
		case .pwmOutput: PWM_OUTPUT
		case .pwmMSOutput: PWM_MS_OUTPUT
		case .pwmBALOutput: PWM_BAL_OUTPUT
		case .gpioClock: GPIO_CLOCK
		case .softwarePWMOutput: SOFT_PWM_OUTPUT
		case .softwareToneOutput: SOFT_TONE_OUTPUT
		case .pwmToneOutput: PWM_TONE_OUTPUT
		case .off: PM_OFF
		}
	}
}
