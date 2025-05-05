#include "wiringPi.h"

void piGpioLayoutOops (const char *why)
{}

int wiringPiFailure (int fatal, const char *message, ...)
{ return 0; }

void wiringPiVersion	(int *major, int *minor)
{}
int wiringPiGlobalMemoryAccess(void)
{ return 0; }
int wiringPiUserLevelAccess (void)
{ return 0; }
int wiringPiSetup       (void)
{ return 0; }
int wiringPiSetupSys    (void)
{ return 0; }
int wiringPiSetupGpio   (void)
{ return 0; }
int wiringPiSetupPhys   (void)
{ return 0; }
int wiringPiSetupPinType(enum WPIPinType pinType)
{ return 0; }
int wiringPiSetupGpioDevice(enum WPIPinType pinType)
{ return 0; }

         int  wiringPiGpioDeviceGetFd()
         { return 0; }
         void pinModeAlt          (int pin, int mode)
         { }
         enum WPIPinAlt getPinModeAlt       (int pin)
         { return 0; }
         void pinMode             (int pin, int mode)
         { }
         void pullUpDnControl     (int pin, int pud)
         { }
         int  digitalRead         (int pin)
         { return 0; }
         void digitalWrite        (int pin, int value)
         { }
unsigned int  digitalRead8        (int pin)
{ return 0; }
         void digitalWrite8       (int pin, int value)
         { }
         void pwmWrite            (int pin, int value)
         { }
         int  analogRead          (int pin)
         { return 0; }
         void analogWrite         (int pin, int value)
         { }

// PiFace specifics
//	(Deprecated)

int  wiringPiSetupPiFace (void)
{ return 0; }
int  wiringPiSetupPiFaceForGpioProg (void)
{ return 0; }

// On-Board Raspberry Pi hardware specific stuff

          int  piGpioLayout        (void)
          { return 0; }
          int  piBoardRev          (void)
          { return 0; }
          void piBoardId           (int *model, int *rev, int *mem, int *maker, int *overVolted)
          {}
          int  piBoard40Pin        (void)
          { return 0; }
          int  piRP1Model          (void)
          { return 0; }
          int  wpiPinToGpio        (int wpiPin)
          { return 0; }
          int  physPinToGpio       (int physPin)
          { return 0; }
          void setPadDrive         (int group, int value)
          {}
          void setPadDrivePin      (int pin, int value)
          {}
          int  getAlt              (int pin)
          { return 0; }
          void pwmToneWrite        (int pin, int freq)
          {}
          void pwmSetMode          (int mode)
          {}
          void pwmSetRange         (unsigned int range)
          {}
          void pwmSetClock         (int divisor)
          {}
          void gpioClockSet        (int pin, int freq)
          {}
 unsigned int  digitalReadByte     (void)
 { return 0; }
 unsigned int  digitalReadByte2    (void)
 { return 0; }
          void digitalWriteByte    (int value)
          {}
          void digitalWriteByte2   (int value)
          {}

int  waitForInterrupt    (int pin, int mS)
{ return 0; }
int  wiringPiISR         (int pin, int mode, void (*function)(void))
{ return 0; }
int  wiringPiISRStop     (int pin)
{ return 0; }
int  waitForInterruptClose(int pin)
{ return 0; }

int  piThreadCreate      (void *(*fn)(void *))
{ return 0; }
void piLock              (int key)
{  }
void piUnlock            (int key)
{ }

// Schedulling priority

int piHiPri (const int pri)
{ return 0; }

// Extras from arduino land

void         delay             (unsigned int howLong)
{}
void         delayMicroseconds (unsigned int howLong)
{}
unsigned int millis            (void)
{ return 0; }
unsigned int micros            (void)
{ return 0; }

unsigned long long piMicros64(void)
{ return 0; }
