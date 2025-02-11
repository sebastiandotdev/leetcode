export function is_palindrome_string(word: string) {
  const MINUS_ONE = 1;
  let is_palindrome = true;

  for (let index = 0; index < word.length / 2; index++) {
    const current_char = word[index].toLowerCase();
    const opposite_char = word[word.length - index - MINUS_ONE].toLowerCase();

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
