package main

import "fmt"

// Types Primitives
// String
// Number (int, int8,...)
// Boolean
// Float Only (float32, float64)

// Defination variables
// use (var, const) <name> <type> = "value"
var (
	yourName   string = "Sebastián García"
	iLikeYouDo string = "Lately"
)

const (
	dieForYou string = "I heart that"
	goLang    string = "by Google"
)

func main() {
	// Use variable short statement
	readme := "README.md"
	gitignore := ".gitignore"

	year := 18

	/*
		// Operartor compare
		* >
		* <
		* >=
		* <=
		* ==
		* !=
	*/

	/*
		// Operator logic
		* ||
		* &&
		* !
		*
	*/

	if year >= 18 {
		fmt.Println("Is big")
	} else if year <= 17 {
		fmt.Println("Is small")
	} else {
		fmt.Println("Is a deprarator")
	}

	if year >= 18 && year < 22 {
		fmt.Println("Your can")
	} else {
		fmt.Println("Something")
	}

	if declararVariable := 20; declararVariable == 20 {
		fmt.Println("Declaration")
	}

	switch year {
	case 18:
		fmt.Println("Is big... In Switch")
	default:
		fmt.Println("Is default")
	}

	defer sum()
	result, str := sumWithParams(10, 20)

	b()
	fmt.Println(result, str)
	fmt.Println(readme, gitignore)

	// For loops

	for index := 0; index <= 10; index++ {
		fmt.Println(index)
	}

	fmt.Println("a" + "b")
	fmt.Printf("s %s", "Hola Mundo\n")

	printNumbers(10)
	printNumbers(20)
}

func printNumbers(num int) {
	fmt.Printf("-------- ENTEROS DEL NUMERO %d -------\n ", num)

	for number := 0; number <= num; number++ {
		if number%2 == 0 {
			fmt.Printf("PAR: %d\n", number)
		} else if number%2 == 1 {
			fmt.Printf("IMPAR: %d\n", number)
		} else {
			fmt.Printf("NO ES PAR NI IMPAR: %d\n", number)
		}
	}
}

// Función base
func sum() int {
	fmt.Println("Ultimate")
	return 10 + 10
}

// Funcíon con parametros
func sumWithParams(a int, b int) (int, string) {

	return a + b, "Hola Mundo"
}

func trace(s string) string {
	fmt.Println("entering:", s) // L: 1, G: 3
	return s
}

func un(s string) {
	fmt.Println("leaving:", s) // L: 5, G: 4
}

func a() {
	defer un(trace("a")) // L: 3, G: 6
	fmt.Println("in a")  // L: 4,  G: 2
}

func b() {
	defer un(trace("b")) // L: 6, G: 5
	fmt.Println("in b")  // L: 2,  G: 1
	a()
}

// PARES: 2, 4, 6, 8
// IMPARES: 3, 5, 7, 9
