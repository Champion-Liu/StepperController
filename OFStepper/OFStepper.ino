#include <TMCStepper_UTILITY.h>
#include <TMCStepper.h>
#include <CmdMessenger.h>

#define USE_COMMANDLINE

CmdMessenger cmdMsg = CmdMessenger(Serial, ' ', '\n');

enum
{
  IdxGetVelActual,
  IdxGetPosActual,
  IdxGetPosTarget,
  IdxSetPosTarget,
  IdxSetHome,
  IdxReset,
  IdxStop
};

const int   cs_pin  = 10;     //!< Chip Select
const float r_sense = 0.075;  //!< Resistant of Sensing

TMC5160Stepper driver = TMC5160Stepper(cs_pin, r_sense);


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  SPI.begin();
  
  pinMode(cs_pin, OUTPUT);

  Serial.print("[sys] TMC Stepper Init...");
  driver.begin();
  param_config();
  Serial.println("Done!");

  cmdMsg.attach(cmdHelpper);

  cmdMsg.attach(IdxGetVelActual, getVelActual);
  cmdMsg.attach(IdxGetPosActual, getPosActual);
  cmdMsg.attach(IdxGetPosTarget, getPosTarget);
  cmdMsg.attach(IdxSetPosTarget, setPosTarget);
  cmdMsg.attach(IdxSetHome, setHome);
  cmdMsg.attach(IdxReset, resetConfig);
  cmdMsg.attach(IdxStop, stopMove);
}

void loop() {
  // put your main code here, to run repeatedly:
  cmdMsg.feedinSerialData();
}

/** 
 * Driver Parameter Initialization
 */
void param_config()
{
  driver.reset();

  driver.microsteps(16);
  driver.rms_current(800);
  
  driver.toff(3);
  driver.hstrt(4);
  driver.hend(1);
  driver.tbl(2);
  driver.chm(0);

  driver.ihold(10);
  driver.irun(31);
  driver.iholddelay(6);
  
  driver.TPOWERDOWN(10);

  driver.en_pwm_mode(1);
  driver.TPWMTHRS(500);


  driver.A1(1000);
  driver.V1(50000);
  driver.AMAX(500);
  driver.VMAX(200000);
  driver.DMAX(700);
  driver.D1(1400);
  driver.VSTOP(10);
  driver.RAMPMODE(0);

  delay(100);
}

//////////////////////////

void cmdHelpper()
{
  Serial.println("# === Helper === #");
  
  Serial.println("[Get]");
  Serial.println(" |-->Vel_Actual:\t0");
  Serial.println(" |-->Pos_Actual:\t1");
  Serial.println(" |-->Pos_Target:\t2");

  Serial.println("[Set]");
  Serial.println(" |-->Pos_Target:\t3");
  Serial.println(" |-->Home:\t\t4");
  Serial.println(" |-->Reset:\t\t5");
  Serial.println(" |-->Stop:\t\t6");

  Serial.println();
}

//////////////////////////

void getVelActual()
{
  #ifdef USE_COMMANDLINE
  Serial.print("V ");
  #else
  Serial.print("[cmd] GetActualVel = ");
  #endif
  Serial.println(driver.VACTUAL());

  #ifdef USE_COMMANDLINE
  Serial.println("S 1");
  #endif
}

void getPosActual()
{
  #ifdef USE_COMMANDLINE
  Serial.print("P ");
  #else
  Serial.print("[cmd] GetActualPos = ");
  #endif
  Serial.println(driver.XACTUAL());

  #ifdef USE_COMMANDLINE
  Serial.println("S 1");
  #endif
}

void getPosTarget()
{
  #ifdef USE_COMMANDLINE
  Serial.print("T ");
  #else
  Serial.print("[cmd] GetTargetPos = ");
  #endif
  Serial.println(driver.XTARGET());

  #ifdef USE_COMMANDLINE
  Serial.println("S 1");
  #endif
}

void setPosTarget()
{
  int32_t t = cmdMsg.readInt32Arg();
  driver.XTARGET(t);

  #ifdef USE_COMMANDLINE
  Serial.println("S 1");
  #else
  Serial.print("[cmd] SetTargetPos = ");
  Serial.println(t);
  #endif
}

void setHome()
{
  driver.XACTUAL(0);

  #ifdef USE_COMMANDLINE
  Serial.println("S 1");
  #else
  Serial.println("[cmd] SetHome");
  #endif
}

void resetConfig()
{
  param_config();
  #ifdef USE_COMMANDLINE
  Serial.println("S 0");
  #else
  Serial.println("[cmd] Reset");
  #endif
}

void stopMove()
{
  int32_t t = driver.XACTUAL();
  driver.XTARGET(t);

  #ifdef USE_COMMANDLINE
  Serial.println("S -1");
  #else
  Serial.println("[cmd] Stop");
  #endif
}
