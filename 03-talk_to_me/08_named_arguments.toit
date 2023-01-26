say_hi --greeting="Hello" --name="World":
    print "$greeting, $name!"

main:
    say_hi --name="World"
    say_hi --name="Universe"
    say_hi --name="Mars" --greeting="Hi"
