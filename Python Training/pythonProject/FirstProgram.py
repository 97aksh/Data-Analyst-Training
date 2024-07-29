# # First Program---
#
# name = "Akshay"
# age = 27
#
# name = "Rahul"
# age = 35
# print("Hello", name, "Age is", age)
#
# #  Take input from user---
#
# name = input("Enter the name here : ")
# print(name)
#
# # Type Conversion---
#
# old_age = input("Enter the age here : ")
# new_age = float(old_age) + 2
# print (new_age)

# # Print sum of two numbers---
#
# first_num = input("Enter the first number here : ")
# second_num = input("Enter the second number here : ")
#
# sum = int(first_num) + int(second_num)
# print("The sum is : ", sum)

# # String Functions--
#
# name = "Rohit Sharma"
# print(name.upper())
# print(name.find('S'))
# print(name.replace("Sharma", "Hitman"))

# # Keywords--
#
# name = "Rohit Sharma"
# print('R' in name)

# # Arithmetic Operators--
#
# num1 = 112
# num2 = 22
# print(num1 / num2)
# print(num1 // num2)
# print(num1 % num2)
# print(6 ** 2)

# # Shortcuts--
#
# i = 5
# i +=3
# print(i)

# # Operator Precedence

# result = 2 + 3 * 5
# result1 = (2 + 3) * 5
# print(result, result1)

# # Comparison Operators---
#
# print(3 > 2)
# print(3 <= 2)
# print(3 != 2)
# print(not 2 >= 3)

# # Logical Operators--
#
# print(3 > 2 or 5 > 9)
# print(3 > 2 and 5 > 9)

# # If Else statement--
#
# age = 5.5
# if age >= 18:
#     print("You are an Adult.")
#     print("You can Vot!")
#
# elif age < 18 and age > 5:
#     print("You are in school.")
#
# else:
#     print("You are a kid!")
# print("Thank You!")

# # while loop---
#
# i = 1
# while i <= 10:
#     print(i)
#     i = i + 1

# i = 1
# while i <= 5:
#     print(i * "A")
#     i = i + 1
#
# i = 5
# while i >= 0:
#     print(i * "A")
#     i = i - 1

# # for loop---

# for item in range(5):
#     print(item + 1)
#
# for item in range(5):
#     print(item)

# # List

# marks = [22, 33, 22, 44, 78, "Akshay"]
# print(marks)
# print(marks[-1])
# print(marks[0:2])
#
# for score in marks:
#     print(score)

# marks.append(99)
# print(marks)

# marks.insert(0, 99)
# print(marks)

# print(22 in marks)
# print(len(marks))

# # Break and Continue---
#
# employees = ["Akshay", "Rohit", "Rahul", "Smriti", "Arshey"]
#
# print("Break statement-")
# for name in employees:
#     if name == "Rahul":
#         break;
#     print(name)
#
# print("Continue statement-")
# for name in employees:
#     if name == "Smriti":
#         continue;
#     print(name)

# # Tuple---
#
# marks = (99, 96, 92, 92, 92, 99)
#
# # print(marks)
#
# # for i in marks:
# #     print(i)
#
# print(marks.count(92))
# print(marks.index(99))

# Set---

# marks = {89, 99, 87, 90, 99, 89, 89}
#
# print(marks)
# marks.add(80)
# print(marks)

# # Dictionary---
#
# marks = {"English" : 89, "Chemistry" : 88, "Physics" : 92}
#
# print(marks["Chemistry"])
# marks["Math"] = 87
# print(marks)
#
# for m in marks:
#     print (m)

# Functions---

# int(), str(), float(), min(), max(), range(),....
# Inbuilt Functions
# Module Functions --- imports

# from math import *
# print(sqrt(36))

# # User defined functions---
# def sum(a, b):
#     print (a + b)
#
# sum(2, 88)

# # Lambda Function---
#
# def double(a):
#     return a*10
# print(double(2))
#
# doublee = lambda a: a*10
# print(doublee(4))
#
# sum = lambda a, b, c: (a + b)/c
# print(sum(2,5, 2))
#
# # Pass function in function---
# def master_function(f1, values):
#     return 2 + f1(values)
#
# print(master_function(doublee, 22))

# # Map---
#
# def cube(a):
#     return a * a * a
#
# nums = [3, 2, 9, 7,4]
# nums_cube = list(map(cube, nums))
# print(nums_cube)

# # Filter---
#
# numbers = [3, 2, 9, 7,4]
#
# def filter_function(a):
#     return a>3
#
# filtered_nums = list(filter(filter_function, numbers))
# print(filtered_nums)

# # Reduce---
#
# from functools import reduce
#
# numbers = [3, 2, 9, 7,4]
#
# def my_sum(a, b):
#     return a + b
#
# numbers_sum = reduce(my_sum, numbers)
#
# print(numbers_sum)














