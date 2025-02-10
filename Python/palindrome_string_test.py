import palindrome_string


def test_return_false_palindrome():
    not_is_palindrome = palindrome_string.is_palindrome_string("Alucard")

    assert not_is_palindrome == False
