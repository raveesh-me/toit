fib n:
  if n <= 1: return n
  // I am used to always passing parameters in parantheses.
  // The operators precendence messes with my brain a little.
  return (fib n - 1) + (fib n - 2)

main:
  print "The 11th Fibonacci number is $(fib 11 - 1)"

/**

Toit also has the usual array of 
infix operators, +, -, *, /, % etc. and the 
relational operators <, <=, >, >=, == and !=. 
The operators have higher precedence than 
function arguments, so we had to group the calls 
in parentheses to get the desired behavior.

The high precedence is what makes the arguments 
for the recursive invocation of fib work. 

*/