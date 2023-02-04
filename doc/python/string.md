# Overview

* Strings in Python are sequences of characters, and can be enclosed in either single quotes ' or double quotes ".
* To create a string, use either single quotes or double quotes: my_string = "hello"
* To access characters in a string, use the index of the character: my_string[2] returns "l"
* Strings in Python are immutable, so you cannot change individual characters. However, you can concatenate strings using the + operator or repeat strings using the * operator: "hello" + "world" returns "helloworld"
* To find the length of a string, use the len function: len("hello") returns 5
* To format a string, use the format method: "hello {}".format("world") returns "hello world"
* To split a string into an array of strings, use the split method: "hello world".split() returns ["hello", "world"]
* To check if a string starts with a certain prefix or ends with a certain suffix, use the startswith and endswith methods: "hello".startswith("he") returns True

# Methods

* str.upper(): returns the string in uppercase
* str.lower(): returns the string in lowercase
* str.strip(): returns a copy of the string with leading and trailing whitespaces removed
* str.replace(old, new): returns a copy of the string with all occurrences of old replaced by new
* str.split(sep): returns a list of strings split by sep
* str.join(iterable): returns a string concatenated with the elements of iterable, separated by the string
* str.format(): returns a formatted string using placeholders specified with curly braces {}
* str.find(sub): returns the lowest index in the string where sub is found, or -1 if not found
* str.startswith(prefix): returns True if the string starts with prefix, False otherwise
* str.endswith(suffix): returns True if the string ends with suffix, False otherwise

# Examples

``` python
# Creating a string
my_string = "hello world"

# Printing each character in the string using a for loop
for char in my_string:
    print(char)

# Output:
# h
# e
# l
# l
# o
#  
# w
# o
# r
# l
# d

# Accessing a single character in the string using an index
print(my_string[2])

# Output:
# l

# Concatenating two strings using the + operator
new_string = "hello" + " world"
print(new_string)

# Output:
# hello world

# Repeating a string using the * operator
repeated_string = "hello" * 3
print(repeated_string)

# Output:
# hellohellohello

# Finding the length of a string using the len function
length = len(my_string)
print(length)

# Output:
# 11

# Formatting a string using the format method
formatted_string = "hello {}".format("world")
print(formatted_string)

# Output:
# hello world

# Splitting a string into an array of strings using the split method
splitted_string = my_string.split()
print(splitted_string)

# Output:
# ['hello', 'world']

# Checking if a string starts with a certain prefix using the startswith method
starts_with_h = my_string.startswith("h")
print(starts_with_h)

# Output:
# True

# Checking if a string ends with a certain suffix using the endswith method
ends_with_d = my_string.endswith("d")
print(ends_with_d)

# Output:
# True
```
