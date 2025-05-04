import CWiringPi

private extension Int32 {
	var guardSuccess: Int32? {
		self == -1 ? nil : self
	}
}

public enum I2C {
	public struct FileHandle {
		let address: Int32
	}

	/// Opens the specific I2C device.
	///
	/// Note that ``setup(deviceId:)`` calls this internally depending on the GPIO layout.
	public static func setupInterface(device: String, deviceId: Int32) -> FileHandle {
		.init(address: wiringPiI2CSetupInterface(device, deviceId))
	}

	/// Opens the default I2C for the current board.
	public static func setup(deviceId: Int32) -> FileHandle {
		.init(address: wiringPiI2CSetup(deviceId))
	}

	public static func read(_ fd: FileHandle) -> Int32? {
		wiringPiI2CRead(fd.address).guardSuccess
	}
	public static func readReg8(_ fd: FileHandle, register: Int32) -> Int32? {
		wiringPiI2CReadReg8(fd.address, register).guardSuccess
	}
	public static func readReg16(_ fd: FileHandle, register: Int32) -> Int32? {
		wiringPiI2CReadReg16(fd.address, register).guardSuccess
	}

	// Ignored for now because the pointers complicate things
//	public static func readBlockData(_ fd: FileHandle, register: Int32) {
//		wiringPiI2CReadBlockData(fd.address, register, uint8_t *values, uint8_t size)
//	}
//	public static func rawRead(_ fd: FileHandle) {
//		wiringPiI2CRawRead(fd.address, uint8_t *values, uint8_t size)
//	}

	public static func write(_ fd: FileHandle, data: Int32) -> Int32 {
		wiringPiI2CWrite(fd.address, data)
	}
	public static func writeReg8(_ fd: FileHandle, register: Int32, data: Int32) -> Int32 {
		wiringPiI2CWriteReg8(fd.address, register, data)
	}
	public static func writeReg16(_ fd: FileHandle, register: Int32, data: Int32) -> Int32 {
		wiringPiI2CWriteReg16(fd.address, register, data)
	}

	// Ignored for now because the pointers complicate things
//	public static func writeBlockData(_ fd: FileHandle, register: Int32) {
//		wiringPiI2CWriteBlockData(fd.address, register, const uint8_t *values, uint8_t size)
//	}
//	public static func rawWrite(_ fd: FileHandle) {
//		wiringPiI2CRawWrite(fd.address, const uint8_t *values, uint8_t size)
//	}
}
