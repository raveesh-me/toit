import gpio
main:
    while true:
        pin := gpio.Pin 5 --output
        pin.set 1
        sleep --ms=1000
        pin.set 0
        sleep --ms=1000
        pin.close     
