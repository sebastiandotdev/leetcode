const MINUS_ONE = 1;

export function is_palindrome_string(word: string) {
  const len_string = word.length;
  let is_palindrome = true;

  for (let i = 0; i < len_string / 2; i++) {
    const current_char = word[i].toLowerCase();
    const opposite_char = word[len_string - i - MINUS_ONE].toLowerCase();

    if (current_char !== opposite_char) {
      is_palindrome = false;
      break;
    }
  }

  if (is_palindrome) {
    console.log("La palabara %o es un palindromo", word);
  } else {
    console.log("La palabara %o no es un palindromo", word);
  }

  return is_palindrome;
}
