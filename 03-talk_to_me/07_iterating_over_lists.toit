main:
  list := [ "Horse", "Fish", "Radish", "Baboon" ]
  print "There are $(list.size) elements in the list"
  print "Here they are:"
  list.do: print "Element = $it"

  print "Here they are (sorted):"
  list.sort --in_place
  list.do: print "Element = $it"

  print "$(list.join "loves: ,")"
