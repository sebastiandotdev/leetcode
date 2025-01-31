fun TwoSum(nums: IntArray, target: Int): IntArray {
    val map = mutableMapOf<Int, Int>()
    for ((index, num) in nums.withIndex()) {
        val value = target - num

        if (map.containsKey(value)) {
            // WARN: Si no estas seguro de que el valor venga no uses !! ya que lanzara un
            // NullPointerException
            return intArrayOf(map[value]!!, index)
        }

        map[num] = index
    }

    return intArrayOf()
}

fun main() {
    val nums = intArrayOf(2, 7, 11, 15)

    val target = 9

    val result = TwoSum(nums, target)

    println("Ejemplo 1: ${result.toList()}") // [0, 1]
}
