class Greeter:
    // made the field private by adding an _ at the end of its name
    name_ := null

    constructor .name_="World":
    // added a custom getter for the name field that also trims the field as it returns
    name: return name_.trim
    
    say_hi: print "Hi $name!"
    say_bye: print "Bye $name, come back soon."

main:
    greetRaveesh := Greeter "    Raveesh     "
    greetRaveesh.say_hi
    greetRaveesh.say_bye
