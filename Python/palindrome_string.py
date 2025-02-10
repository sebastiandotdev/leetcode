def is_palindrome_string(word: str):
    MINUS_ONE = 1
    is_palindrome = True

    for index in range(round(len(word) / 2)):
        current_word = word[index].lower()
        opposite_char = word[len(word) - index - MINUS_ONE].lower()

        if current_word != opposite_char:
            is_palindrome = False
            break

    if is_palindrome:
        print("La palabara {} es un palindromo".format(word))
    else:
        print("La palabara {} no es un palindromo".format(word))

    return is_palindrome
