// TODO: Sin hacer mutacion con String
export function isPalindrome(x: number): boolean {
    const number = String(x).split("").reverse().join("");
    const parseNumber = Number.parseInt(number);

    if (parseNumber < 0) return false;
    if (parseNumber !== x) return false;

    return true;
}
