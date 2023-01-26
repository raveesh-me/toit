class Greeter:
    // null init
    name := null
    // constructors support initializers
    constructor .name="World":

    // methods can also be defined in a single line
    say_hi: print "Hi, $name.trim"

    say_bye: print "See you again, $name.trim"


main:
    greetRaveesh := Greeter "Raveesh"
    greetRaveesh.say_hi
    greetRaveesh.say_bye

    greetWorld := Greeter
    greetWorld.say_hi
    greetWorld.say_bye
    