fun main() {
    println("Hello world")

    val POPCORN = 10
    val HOTDOG = 7
    var customers = 10

    println(customers)

    customers = 8

    println(customers)
    println("There are ${customers + 1} customers")

    println(HOTDOG)
    println(POPCORN)

    /** Complete the code to make the program print "Mary is 20 years old" to standard output: */
    val name = "Mary"
    val age = 20

    println("$name is $age years old")

    /**
     * +---------------------------+------------------------+----------------------------------------+
     * | Categoría | Tipos básicos | Código de ejemplo |
     * +---------------------------+------------------------+----------------------------------------+
     * | Números enteros | Byte, Short, Int, Long | val year: Int = 2020 |
     * +---------------------------+------------------------+----------------------------------------+
     * | Enteros sin signo | UByte, UShort, | val score: UInt = 100u | | | UInt, ULong | |
     * +---------------------------+------------------------+----------------------------------------+
     * | Números de punto flotante | Float, Double | val currentTemp: Float = 24.5f | | | | val
     * price: Double = 19.99 |
     * +---------------------------+------------------------+----------------------------------------+
     * | Booleanos | Boolean | val isEnabled: Boolean = true |
     * +---------------------------+------------------------+----------------------------------------+
     * | Personajes | Char | val separator: Char = ',' |
     * +---------------------------+------------------------+----------------------------------------+
     * | Instrumentos de cuerda | String | val message: String = "Hello, world!" |
     * +---------------------------+------------------------+----------------------------------------+
     */
    // Ejemplos de tipos numéricos enteros en Kotlin

    // Byte (8 bits): -128 a 127
    val temperatura: Byte = 24
    val nivelBrillo: Byte = -7
    val codigoASCII: Byte = 65

    // Short (16 bits): -32768 a 32767
    val alturaPixeles: Short = 1080
    val abricacion: Short = 2023
    val codigoProducto: Short = 12345

    // Int (32 bits): -2^31 a 2^31-1
    val poblacionCiudad: Int = 1500000
    val puntuacionJuego: Int = 9875
    val diasTranscurridos: Int = 365

    // Long (64 bits): -2^63 a 2^63-1
    val numeroTelefono: Long = 34612345678L
    val idUsuario: Long = 9223372036854775807L
    val microsegundos: Long = 1234567890123L

    val sumaByte: Byte = (temperatura + nivelBrillo).toByte()
    val multiplicacionShort: Short = (alturaPixeles * 2).toShort()
    val sumaInt = poblacionCiudad + 1000
    val multiplicacionLong = numeroTelefono * 2L

    println("Suma Byte: $sumaByte")
    println("Multiplicación Short: $multiplicacionShort")
    println("Suma Int: $sumaInt")
    println("Multiplicación Long: $multiplicacionLong")
    println(codigoASCII)
    println(abricacion)
    println(codigoProducto)
    println(puntuacionJuego)
    println(diasTranscurridos)
    println(idUsuario)
    println(microsegundos)

    // Read only list
    val readOnlyShapes = listOf("triangle", "square", "circle")
    println(readOnlyShapes)
    println("Access position: ${readOnlyShapes[0]}")
    println("Access position list() : ${readOnlyShapes.first()}")
    println("Access position last() : ${readOnlyShapes.last()}")
    println("Get length count() : ${readOnlyShapes.count()}")

    val shapes: MutableList<String> = mutableListOf("triangle", "square", "circle")
    println(shapes)

    shapes.add("pentagon")
    println(shapes)

    shapes.remove("pentagon")
    println(shapes)

    val listMutableShapes = mutableListOf("triangle", "square", "circle")
    val shapesLocked: List<String> = listMutableShapes

    println("Locked list: $shapesLocked")
    println("square" in shapesLocked)

    val setReadOnly = setOf("triangle", "square", "circle", "circle")
    println(setReadOnly)

    val setMutable = mutableSetOf("triangle", "square", "circle", "circle")
    setMutable.add("square")
    setMutable.add("squarex")

    println(setMutable)

    val readOnlyFruit = setOf("apple", "banana", "cherry", "cherry")
    println("This set has ${readOnlyFruit.count()} items")

    val readOnlyJuiceMenu = mapOf("apple" to 10, "kiwi" to 100, "orange" to 200)
    println(readOnlyJuiceMenu)
    println("The value of apple juice is: ${readOnlyJuiceMenu["apple"]}")

    val juiceMenu: MutableMap<String, Int> =
            mutableMapOf("apple" to 10, "kiwi" to 100, "orange" to 200)
    println(juiceMenu)

    // val juiceMenuMap: MutableMap<String, Int> =
    //         mutableMapOf("apple" to 100, "kiwi" to 190, "orange" to 100)
    // val juiceMenuLocked: Map<String, Int> = juiceMenu

    // Read-only map
    val readOnlyJuiceMenuNull = mapOf("apple" to 100, "kiwi" to 190, "orange" to 100)
    println("The value of pineapple juice is: ${readOnlyJuiceMenuNull["pineapple"]}")
    // The value of pineapple juice is: null

    val juiceMenuChange: MutableMap<String, Int> =
            mutableMapOf("apple" to 100, "kiwi" to 190, "orange" to 100)

    juiceMenuChange["coconut"] = 150 // Add key "coconut" with value 150 to the map
    println(juiceMenuChange)
    // {apple=100, kiwi=190, orange=100, coconut=150}

    val juiceMenuRemove: MutableMap<String, Int> =
            mutableMapOf("apple" to 100, "kiwi" to 190, "orange" to 100)
    juiceMenuRemove.remove("orange") // Remove key "orange" from the map
    println(juiceMenuRemove)

    val readOnlyJuiceMenuProperties = mapOf("apple" to 100, "kiwi" to 190, "orange" to 100)
    println(readOnlyJuiceMenuProperties.keys)
    // [apple, kiwi, orange]
    println(readOnlyJuiceMenuProperties.values)
    // [100, 190, 100]

    val greenNumbers = listOf(1, 4, 23)
    val redNumbers = listOf(17, 2)
    val totalNumbers = greenNumbers.count() + redNumbers.count()

    println("The amount of green numbers is: ${greenNumbers.count()}")
    println("The amount of red numbers is: ${redNumbers.count()}")
    println("Total number is: $totalNumbers")

    val SUPPORTED = setOf("HTTP", "HTTPS", "FTP")
    val requested = "smtp"
    val isSupported = requested.uppercase() in SUPPORTED
    println("Support for $requested: $isSupported")

    val number2word = mapOf(1 to "one", 2 to "two", 3 to "three")
    val n = 2
    println("$n is spelt as '${number2word[n]}'")
}
