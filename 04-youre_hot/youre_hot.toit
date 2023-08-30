import gpio
import i2c
import math show pow

main:
  bus := i2c.Bus
      --sda=gpio.Pin 21
      --scl=gpio.Pin 22
  devices := bus.scan
  print "Devices: $devices"
  device := bus.device 0x38
  // wait for 100ms to for the sensor to start
  sleep --ms=100
  while true:
    /* 
    After power-on, wait no less than 100ms.  
    Before reading the temperature and humidity value, get a byte of statusword by sending 0x71. 
    If the status word and 0x18 are not equal to 0x18, initialize the 0x1B, 0x1C, 0x1Eregisters, 
    details Please refer to our official website routine for the initialization process;
    if they are equal, proceed to thenext
    */
    device.write #[0x71]
    status_reading := device.read 1
    if status_reading[0] == 0x18:
      print "AHT-25: Device is ready, Sending read signal."
      /**
      Wait 10ms to send the 0xAC command (trigger measurement). This command parameter has two bytes, thefirst
      byte is 0x33, and the second byte is 0x00.
      */
      sleep --ms=12
      device.write #[0xAC, 0x33, 0x00]
      sleep --ms=80
      status-reading = device.read 1
      is_read_ready := status-reading[0] & 0b00000001 == 0
      is_calibrated := status-reading[0] & 0b00010000 == 1
      print "AHT-25: read_ready: $is_read_ready.stringify, CAL_Enable: $is_calibrated.stringify"
      data_reading := device.read 7
      aht-25-reading := AHT25Reading --reading=data_reading
      print "AHT-25: Temperature: $aht-25-reading.temperature.stringify, Humidity: $aht-25-reading.humidity.stringify"
      device.write #[0b10111010]
      sleep --ms=500
    else:
      print "Sensor not ready, performing a soft reset"
      device.write #[0b10111010]
      // TODO: check whether the soft reset worked, and do a hard reset: initialize the 0x1B, 0x1C, 0x1E registers" 
    
    // bus
    sleep --ms=2000
    // device.write
    // status_reading := device.read 100
    // print status_reading



class AHT25Reading:
  temperature /float := 0.0
  humidity /float := 0.0
  divisor := pow 2 20


  get-temperature-from-byte-array --reading /ByteArray -> float:
    temp := reading[3] & 0b00001111 << 16 | reading[4] << 8 | reading[5]
    return temp / divisor * 200.0 - 50

  get-humidity-from-byte-array --reading /ByteArray -> float:
    hum := reading[1] << 12 | reading[2] << 4 | reading[3] & 0b11110000 >> 4
    return hum / divisor * 100

  constructor --reading /ByteArray:
    temperature = get-temperature-from-byte-array --reading=reading
    humidity = get-humidity-from-byte-array --reading=reading