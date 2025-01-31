import kotlin.random.Random

fun main() {
    val d: Int
    val check = true

    if (check) {
        d = 1
    } else {
        d = 2
    }

    println(d)

    val a = 1
    val b = 2

    println(if (b > a) a else b)

    // When

    val obj = "Hello"

    when (obj) {
        "1" -> println("One")
        "Hello" -> println("Gretting")
        else -> println("Unknow")
    }

    // Returns value
    val result =
            when (obj) {
                "1" -> "One"
                "Hello" -> "Gretting"
                else -> "Unknow"
            }

    println(result)

    val trafficLightState = "Red" // This can be "Green", "Yellow", or "Red"

    val trafficAction =
            when {
                trafficLightState == "Green" -> "Go"
                trafficLightState == "Yellow" -> "Slow down"
                trafficLightState == "Red" -> "Stop"
                else -> "Malfunction"
            }

    println(trafficAction)

    // exercism for If
    val firstResult = Random.nextInt(6)
    val secondResult = Random.nextInt(6)

    println(if (firstResult == secondResult) "You Win :)" else "You lose :(")

    // exercism for When

    val button = "A"

    println(
            when (button) {
                "A" -> "Yes"
                "B" -> "No"
                "X" -> "Menu"
                "Y" -> "Nothing"
                else -> "There is no such button"
            }
    )

    // For

    for (number in 1..5) {
        println(number)
    }

    // using collections

    val cakes = listOf("carrot", "cheese", "chocolate")

    for (cake in cakes) {
        println("Yummy, it's a $cake cake!")
    }

    // WHile

    var cakesEaten = 0
    var cakesBaked = 0

    while (cakesEaten < 3) {
        println("Eat a  cake")
        cakesEaten++
    }

    do {
        println("Bake a cake")
        cakesBaked++
    } while (cakesBaked < cakesEaten)
}
