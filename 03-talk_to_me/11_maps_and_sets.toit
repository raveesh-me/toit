class MegaGreeter:    
  // Arrays
  names := []
  // Sets
  uniqueNames := {}
  // Maps
  titles := {:}
  constructor:
  add name title:
    names.add name
    uniqueNames.add name
    titles[name] = title
  say_hi_all:
    // Greet everyone individually!
    names.do: print "Hello, $titles[it] $it!"
  say_hi_unique:
    // Greet unique individually!
    uniqueNames.do: print "Hello, $titles[it] $it!"

main:
  greeter := MegaGreeter
  greeter.add "Lars" "Mr."
  greeter.add "Rikke" "Dr."
  greeter.add "Raveesh" "Mr."
  greeter.add "Raveesh" "Master."
  greeter.add "Raveesh" "Goshujin Sama."
  greeter.add "Raveesh" "Sensei."
  greeter.add "Günter" "Herr Professor Doktor Doktor"
  print "Greeting all:"
  greeter.say_hi_all
  print "Greeting unique:"
  greeter.say_hi_unique
