import .dht11

main:
  sensor := DHTsensor 12 13
  while true:
    sleep --ms=2000
    output := sensor.read_sensor
    print output


