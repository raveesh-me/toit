class Person: 
  constructor:

  isValid [getAge] -> bool:
    age := getAge.call
    return age > 10


main:
  person := Person
  isValid := person.isValid:
    11
  if isValid:
    print "valid"
  else:
    print "invalid"
  isValid = person.isValid:
      1
  if isValid:
    print "valid"
  else:
    print "invalid"
