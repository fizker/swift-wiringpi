#include "wiringPiI2C.h"

int wiringPiI2CRead           (int fd)
{ return 0; }
int wiringPiI2CReadReg8       (int fd, int reg)
{ return 0; }
int wiringPiI2CReadReg16      (int fd, int reg)
{ return 0; }
int wiringPiI2CReadBlockData  (int fd, int reg, uint8_t *values, uint8_t size)
{ return 0; }
int wiringPiI2CRawRead        (int fd, uint8_t *values, uint8_t size)
{ return 0; }

int wiringPiI2CWrite          (int fd, int data)
{ return 0; }
int wiringPiI2CWriteReg8      (int fd, int reg, int data)
{ return 0; }
int wiringPiI2CWriteReg16     (int fd, int reg, int data)
{ return 0; }
int wiringPiI2CWriteBlockData (int fd, int reg, const uint8_t *values, uint8_t size)
{ return 0; }
int wiringPiI2CRawWrite       (int fd, const uint8_t *values, uint8_t size)
{ return 0; }

int wiringPiI2CSetupInterface (const char *device, int devId)
{ return 0; }
int wiringPiI2CSetup          (const int devId)
{ return 0; }
