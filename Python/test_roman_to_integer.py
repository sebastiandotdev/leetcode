import unittest
from roman_to_integer import roman_to_integer


class TestRomanToInger(unittest.TestCase):
    def test_should_return_3(self):
        REFERENCE_NUMBER = 3
        total = roman_to_integer("III")

        self.assertEqual(total, REFERENCE_NUMBER)

    def test_ignore_non_roman_letters(self):
        REFERENCE_NUMBER = 3
        total = roman_to_integer("xInIiIx")

        self.assertEqual(total, REFERENCE_NUMBER)

    def test_should_return_1994(self):
        REFERENCE_NUMBER = 1994
        total = roman_to_integer("MCMXCIV")

        self.assertEqual(total, REFERENCE_NUMBER)

    def test_should_return_4(self):
        REFERENCE_NUMBER = 4
        total = roman_to_integer("IV")

        self.assertEqual(total, REFERENCE_NUMBER)


if __name__ == "__main__":
    unittest.main()
