// faster fiboncci uses a loop instead of inefficient recursion
fib2 n:
  s1 := 0
  s2 := 1
  /// When you want to repeat something n number of times
  n.repeat:
    s3 := s1 + s2
    s1 = s2
    s2 = s3
  return s1

// Prints the numbers from 0 to n (exclusive).
print_n_numbers n:
  // $it keywork contains the current iteration index
  n.repeat: print it

// Prints the odd numbers less than n.
print_odd_numbers n:
  // For statements are still here
  for i := 1; i < n; i += 2:
    print i

// Returns if the Collatz conjecture is true.
collatz n:
  // while statements are also still here
  while n > 1:
    if n % 2 == 0: n = n / 2
    else: n = n * 3 + 1
  return n == 1 


main:
  print "$(fib2 10)" 
  print_n_numbers 10 
  print_odd_numbers 10
  print "10: $(collatz 10)"
  print "13: $(collatz 13)"
