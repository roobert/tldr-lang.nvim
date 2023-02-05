# Overview

JSON (JavaScript Object Notation) is a lightweight data interchange format that is easy for humans to read and write and easy for machines to parse and generate. In Python, the built-in json module can be used to parse JSON data into Python objects, such as dictionaries and lists, and to generate JSON data from Python objects.

# Methods

* json.loads(json_string): Parses a JSON string and returns the equivalent Python object.
* json.dumps(python_object, *, skipkeys=False, ensure_ascii=True, check_circular=True, allow_nan=True, cls=None, indent=None, separators=None, default=None, sort_keys=False, **kw): Serializes a Python object into a JSON string.

# Examples

``` python
import json

# Define some data in JSON format
json_data = """
{
  "name": "John Doe",
  "age": 35,
  "skills": ["Python", "Java", "Ruby"]
}
"""

# Load the JSON data into a Python object
data = json.loads(json_data)
print("Data:", data) # outputs: Data: {'name': 'John Doe', 'age': 35, 'skills': ['Python', 'Java', 'Ruby']}

# Dump the Python object into a JSON string
json_text = json.dumps(data, indent=2)
print("JSON text:", json_text)

# Output:
# JSON text:
# {
#   "name": "John Doe",
#   "age": 35,
#   "skills": [
#     "Python",
#     "Java",
#     "Ruby"
#   ]
# }
```
