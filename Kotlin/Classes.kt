class Contact(val id: Int, var email: String) {
    val category: String = ""

    fun printId(id: Int) {
        println("This id the user: $id")
    }
}

data class User(val name: String, val id: Int)

fun main() {
    val contact = Contact(1, "cro@gmail.com")
    println(contact.email)

    contact.printId(1)

    val user = User("Alex", 1)
    val secondUser = User("Alex", 1)
    val thirdUser = User("Max", 2)

    println("user == thirdUser: ${user == thirdUser}")
    println("user == secondUser: ${user == secondUser}")

    println(user)

    // Creates an exact copy of user
    println(user.copy())
    // User(name=Alex, id=1)

    // Creates a copy of user with name: "Max"
    println(user.copy("Max"))
    // User(name=Max, id=1)

    // Creates a copy of user with id: 3
    println(user.copy(id = 3))
    // User(name=Alex, id=3)
}
