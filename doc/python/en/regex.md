# Overview

Python Regular Expressions (regex or regexp for short) are a way to search for patterns in strings. They are defined using the re module in Python and use special syntax to match and manipulate strings. Regular expressions are useful for tasks such as matching patterns in text, searching and replacing text, and splitting strings into smaller parts based on specific patterns. Common regex syntax includes special characters such as . (matches any character), * (matches zero or more occurrences of the preceding character), and [] (matches any character within the brackets). Regexes in Python can be used in methods such as re.search(), re.findall(), and re.sub().

# Methods

* re.search(pattern, string): Searches for the first occurrence of the pattern in the string and returns a match object if found, otherwise returns None.
* re.findall(pattern, string): Returns a list of all non-overlapping matches of the pattern in the string as strings.
* re.split(pattern, string): Splits the string by the occurrences of the pattern and returns a list of the resulting substrings.
* re.sub(pattern, repl, string): Replaces all occurrences of the pattern in the string with the replacement text specified by repl and returns the modified string.
* re.finditer(pattern, string): Returns an iterator yielding match objects for all non-overlapping matches of the pattern in the string.
* re.compile(pattern): Compiles the pattern into a pattern object, which can be used for pattern matching. This can be useful for using the same pattern multiple times in a script, as the compiled pattern can be reused for efficient processing.

Note: All methods are from the re module in Python, and the pattern argument is a string specifying the regular expression pattern to match.

# Examples

``` python
import re

# Define a string
text = "The quick brown fox jumps over the lazy dog 1234567890"

# Use re.search to find a match
match = re.search(r"fox", text)
if match:
    print("Found:", match.group()) # outputs: Found: fox

# Use re.findall to find all matches
matches = re.findall(r"\d+", text)
print("Digits:", matches) # outputs: Digits: ['1234567890']

# Use re.split to split the string based on a pattern
words = re.split(r"\s+", text)
print("Words:", words) # outputs: Words: ['The', 'quick', 'brown', 'fox', 'jumps', 'over', 'the', 'lazy', 'dog', '1234567890']

# Use re.sub to replace all occurrences of a pattern in a string
new_text = re.sub(r"dog", "cat", text)
print("New text:", new_text) # outputs: New text: The quick brown fox jumps over the lazy cat 1234567890

# Use re.finditer to get all match objects
for match in re.finditer(r"\w+", text):
    print("Match:", match.group())

# Output:
# Match: The
# Match: quick
# Match: brown
# Match: fox
# Match: jumps
# Match: over
# Match: the
# Match: lazy
# Match: dog
# Match: 1234567890
```
