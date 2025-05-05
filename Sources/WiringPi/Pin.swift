import CWiringPi

public enum Pin {
	public typealias Address = Int32

	public enum Value {
		case low
		case high

		public var toggled: Self {
			switch self {
			case .high: .low
			case .low: .high
			}
		}

		public mutating func toggle() {
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

	public enum Pull {
		case off
		case down
		case up
	}
}

extension Pin.Pull {
	init?(rawValue: Int32) {
		switch rawValue {
		case PUD_OFF: self = .off
		case PUD_DOWN: self = .down
		case PUD_UP: self = .up
		default: return nil
		}
	}

	var rawValue: Int32 {
		switch self {
		case .off: PUD_OFF
		case .down: PUD_DOWN
		case .up: PUD_UP
		}
	}
}

extension Pin.Value {
	init?(rawValue: Int32) {
		switch rawValue {
		case HIGH: self = .high
		case LOW: self = .low
		default: return nil
		}
	}

	var rawValue: Int32 {
		switch self {
		case .high: HIGH
		case .low: LOW
		}
	}
}

extension Pin.Mode {
	init?(rawValue: Int32) {
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

	var rawValue: Int32 {
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
