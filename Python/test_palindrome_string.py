import unittest
from palindrome_string import is_palindrome_string


class TestPalindromeString(unittest.TestCase):
    def test_should_return_false(self):
        not_is_palindrome = is_palindrome_string("Alucard")

        self.assertEqual(not_is_palindrome, False)

    def test_should_return_true(self):
        is_palindrome = is_palindrome_string("Oso")

        self.assertEqual(is_palindrome, True)


if __name__ == "__main__":
    unittest.main()
