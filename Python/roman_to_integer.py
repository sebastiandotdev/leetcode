# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000

# For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

# Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

# I can be placed before V (5) and X (10) to make 4 and 9.
# X can be placed before L (50) and C (100) to make 40 and 90.
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer.

# Example 1:

# Input: s = "III"
# Output: 3
# Explanation: III = 3.
# Example 2:

# Input: s = "LVIII"
# Output: 58
# Explanation: L = 50, V= 5, III = 3.
# Example 3:

# Input: s = "MCMXCIV"
# Output: 1994
# Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

from typing import List

roman_numerals = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
}


def to_list(string: str) -> List[str]:
    prepare_list = []

    for current_str in string:
        prepare_list.append(current_str)

    return prepare_list


def roman_to_integer(n: str):
    convert_to_list = to_list(n)
    roman_numeral_in_integer: List[int] = []
    total: List[int] = []

    for numeral in convert_to_list:
        roman_numeral_integer = roman_numerals.get(numeral)

        if not roman_numeral_integer:
            continue

        roman_numeral_in_integer.append(roman_numeral_integer)

    index = 0

    while index < len(roman_numeral_in_integer):
        if (
            index == len(roman_numeral_in_integer) - 1
            or roman_numeral_in_integer[index] >= roman_numeral_in_integer[index + 1]
        ):
            total.append(roman_numeral_in_integer[index])
            index += 1
        else:
            subtract_the_smallest = (
                roman_numeral_in_integer[index + 1] - roman_numeral_in_integer[index]
            )

            total.append(subtract_the_smallest)
            index += 2

    return sum(total)
