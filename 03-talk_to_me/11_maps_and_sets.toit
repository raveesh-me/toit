class MegaGreeter:    
  names := []
  titles := {:}

  constructor:

  add name title:
    names.add name
    titles[name] = title
  say_hi:
    // Greet everyone individually!
    names.do: print "Hello, $titles[it] $it!"

main:
  greeter := MegaGreeter
  greeter.add "Lars" "Mr."
  greeter.add "Rikke" "Dr."
  greeter.add "Günter" "Herr Professor Doktor Doktor"
  greeter.say_hi
