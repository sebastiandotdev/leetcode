fun hello(): String {
    return "Hello, World"
}

fun sum(x: Int, y: Int): Int {
    return x + y
}

fun sumSingleExpression(x: Int, y: Int) = x + y

fun printMessageWithPrefix(message: String, prefix: String = "Info") {
    println("[$prefix] $message")
}

fun printMessage(message: String) {
    println(message)
    // `return Unit` or `return` is optional
}

fun toSeconds(time: String): (Int) -> Int =
        when (time) {
            "hour" -> { value -> value * 60 * 60 }
            "minutes" -> { value -> value * 60 }
            else -> { value -> value }
        }

fun registerUser(username: String, email: String): String {

    val registeredUsernames = mutableListOf("john_doe", "jane_smith")

    val registeredEmails = mutableListOf("john@example.com", "jane@example.com")

    if (username in registeredUsernames) {
        return "Username already taken. Please choose a different username."
    }

    if (email in registeredEmails) {
        return "Email already registered. Please use a different email."
    }

    registeredUsernames.add(username)
    registeredEmails.add(email)

    return "User registered successfully: $username"
}

fun repeatN(n: Int, action: () -> Unit) {
    for (i in 1..n) {
        action()
    }
}

fun main() {
    val greet = hello()
    val result = sum(10, 10)

    println(greet)
    println(result)

    sumSingleExpression(10, 2)

    printMessageWithPrefix("Hello", "log")
    printMessage("Hello Kotlin")

    // WIth prefix
    printMessageWithPrefix(prefix = "Log", message = "Hello")

    println(registerUser("john_doe", "newjohn@example.com"))

    val upperCaseString = { text: String -> text.uppercase() }
    println(upperCaseString("hello"))

    val numbers = listOf(1, -2, 3, -4, 5, -6)

    val positives = numbers.filter({ number -> number > 0 })
    val doubles = numbers.map({ number -> number * 2 })

    val isNegative = { x: Int -> x < 0 }
    val negatives = numbers.filter(isNegative)

    println(positives)
    println(negatives)
    println(doubles)

    // Function types﻿

    val upperCaseStringType: (String) -> String = { text -> text.uppercase() }

    upperCaseStringType("continue")

    val timesInMinutes = listOf(2, 10, 15, 1)
    val min2Sec = toSeconds("minutes")

    val totalTimeInSeconds = timesInMinutes.map(min2Sec).sum()
    println("Total time is $totalTimeInSeconds secs")

    repeatN(5, { println("Hello") })
}
