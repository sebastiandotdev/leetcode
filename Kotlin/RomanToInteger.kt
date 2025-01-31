/**
 * Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 *
 * Symbol Value I 1 V 5 X 10 L 50 C 100 D 500 M 1000
 *
 * For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as
 * XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
 *
 * Roman numerals are usually written largest to smallest from left to right. However, the numeral
 * for four is not IIII. Instead, the number four is written as IV. Because the one is before the
 * five we subtract it making four. The same principle applies to the number nine, which is written
 * as IX. There are six instances where subtraction is used:
 *
 * I can be placed before V (5) and X (10) to make 4 and 9. X can be placed before L (50) and C
 * (100) to make 40 and 90. C can be placed before D (500) and M (1000) to make 400 and 900. Given a
 * roman numeral, convert it to an integer.
 *
 * Example 1:
 *
 * Input: s = "III" Output: 3 Explanation: III = 3. Example 2:
 *
 * Input: s = "LVIII" Output: 58 Explanation: L = 50, V= 5, III = 3. Example 3:
 *
 * Input: s = "MCMXCIV" Output: 1994 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 */
fun romanToInteger(s: String): Int {
    val romanNumerals =
            mapOf('I' to 1, 'V' to 5, 'X' to 10, 'L' to 50, 'C' to 100, 'D' to 500, 'M' to 1000)

    val romanNumeralInInteger = mutableListOf<Int>()
    val total = mutableListOf<Int>()

    for (numeral in s) {
        romanNumerals[numeral]?.let { romanNumeralInInteger.add(it) }
    }

    var i = 0
    while (i < romanNumeralInInteger.size) {
        when {
            i == romanNumeralInInteger.lastIndex -> {
                total.add(romanNumeralInInteger[i])
                i++
            }
            romanNumeralInInteger[i] >= romanNumeralInInteger[i + 1] -> {
                total.add(romanNumeralInInteger[i])
                i++
            }
            else -> {
                total.add(romanNumeralInInteger[i + 1] - romanNumeralInInteger[i])
                i += 2
            }
        }
    }

    return total.sum()
}

fun main() {
    println(romanToInteger("IV")) // Outputs: 4
    println(romanToInteger("IX")) // Outputs: 9
    println(romanToInteger("LVIII")) // Outputs: 58
    println(romanToInteger("MCMXCIV")) // Outputs: 1994
}
