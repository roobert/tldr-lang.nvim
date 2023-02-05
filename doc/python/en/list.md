# Overview

* Arrays are implemented as lists in Python, and can store elements of any data type.
* To create an array, use square brackets []: my_list = [1, 2, 3, 4]
* To access elements in the array, use the index of the element: my_list[2] returns 3
* To update elements in the array, assign a new value to the index: my_list[2] = 5
* To find the length of an array, use the len function: len(my_list) returns 4
* Arrays in Python are dynamic and can grow and shrink as needed, using methods such as append, extend, insert, and pop.
* Lists can also be sorted and reversed, and can be used with iteration and slicing.
* Lists can contain elements of different data types, including other lists, which makes them useful for nested data structures.

# Methods

* list.append(item): adds an item to the end of the list
* list.extend(iterable): extends the list by appending all the items from iterable
* list.insert(index, item): inserts item at the specified index
* list.remove(item): removes the first occurrence of item from the list
* list.pop([index]): removes and returns the item at the specified index (default is the last item)
* list.index(item): returns the first index of item in the list
* list.count(item): returns the number of occurrences of item in the list
* list.sort(): sorts the items in the list in ascending order
* list.reverse(): reverses the order of the items in the list
* list.copy(): returns a shallow copy of the list

# Examples

``` python
# Creating an array of numbers
numbers = [1, 2, 3, 4, 5]

# Printing each number in the array using a for loop
for number in numbers:
    print(number)

# Output:
# 1
# 2
# 3
# 4
# 5

# Using the enumerate function to get the index and value of each element
for index, value in enumerate(numbers):
    print(f"Index: {index}, Value: {value}")

# Output:
# Index: 0, Value: 1
# Index: 1, Value: 2
# Index: 2, Value: 3
# Index: 3, Value: 4
# Index: 4, Value: 5

# Slicing an array to get a subarray
sub_array = numbers[1:3]
print(sub_array)

# Output:
# [2, 3]

# Using the sum function to find the sum of all elements in the array
total = sum(numbers)
print(total)

# Output:
# 15

# Using the sorted function to sort the array
sorted_array = sorted(numbers)
print(sorted_array)

# Output:
# [1, 2, 3, 4, 5]

# Creating a 2D array
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# Printing each element in the 2D array using nested for loops
for row in matrix:
    for value in row:
        print(value)

# Output:
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9

# Using list comprehensions to extract all values in the 2D array
flat_list = [value for row in matrix for value in row]
print(flat_list)

# Output:
# [1, 2, 3, 4, 5, 6, 7, 8, 9]
```
