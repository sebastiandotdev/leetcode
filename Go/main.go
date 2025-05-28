package main

import (
	"errors"
	"fmt"
	"reflect"
	"time"
)

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

type Database interface {
	Connect() error
}

type PostgresDB struct { /* ... */
}

func (p *PostgresDB) Connect() error { /* ... */ return nil }

type MySQLDB struct { /* ... */
}

func (m *MySQLDB) Connect() error { /* ... */ return nil }

func processData(db Database) error {

	return nil
}

type User struct {
	name  string
	email Email
}

type Email string
type Rectangle struct {
	Width  float64
	Height float64
}

type UserId int

func (r Rectangle) Area() float64 {

	return r.Width * r.Height
}

func getUser(id UserId) {
	// ...
}

// func getValueByEmail(email string){}
// func getValueByEmail(e Email){

// }

func getUserById(id UserId) int {
	return int(id)
}

func (r *Rectangle) ChangeWidth(width float64) {
	r.Width = width
}

func getvalue(condition bool) interface{} {
	if condition {
		return "Hello"
	}

	return 30
}

func main() {
	// Use variable short statement
	readme := "README.md"
	gitignore := ".gitignore"

	year := 18
	var userEmail Email
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

	/** Arrays **/

	var a [10]int
	var b []int

	b = append(b, 10)

	//  En la práctica, los slices son mucho más comunes que las matrices.
	primes := [6]int{2, 4, 6, 8, 0, 10}

	fmt.Println("The values of 'primes' is: ", primes)
	fmt.Println("The values of 'b' is: ", b, len(b))

	fmt.Printf("The variable 'a' is type: %T\n", a)
	fmt.Printf("The variable 'b' is type: %T\n", b)

	/** Make with Slices **/

	s1 := make([]int, 5)
	s2 := make([]string, 3, 10)
	s3 := make([]bool, 0, 5)

	fmt.Println("La capacidad de s1 es: ", cap(s1))
	fmt.Println("La capacidad de s2 es: ", cap(s2))
	fmt.Println("La capacidad de s3 es: ", cap(s3))

	/** Make with Maps **/
	m1 := make(map[string]int)

	m1["a"] = 1

	fmt.Println("La capacidad de m1 es: ", m1)

	/** Structs **/
	type Owner struct {
		Name string
	}

	type Pet struct {
		Name  string
		Age   int
		owner Owner
	}

	// func printType(i interface{}) {
	//     switch v := i.(type) {
	//     case int:
	//         println("Es un entero:", v)
	//     case string:
	//         println("Es una cadena:", v)
	//     default:
	//         println("Tipo desconocido")
	//     }
	// }

	var pet0 Pet

	postgres := &PostgresDB{}
	mysql := &MySQLDB{}

	processData(postgres)
	processData(mysql)

	pet1 := Pet{"Gato", 2, Owner{"Sebastián"}}
	pet2 := Pet{
		Name:  "Perro",
		Age:   3,
		owner: Owner{Name: "Sebastián"},
	}

	pet0.Name = "Gato"
	pet0.Age = 2

	rect := Rectangle{Width: 10, Height: 5}
	fmt.Println("El area del rectangulo es: ", rect.Area())

	rect.ChangeWidth(20)
	fmt.Println("El area del rectangulo es: ", rect.Width)
	fmt.Println("El area del rectangulo es: ", rect.Area())

	fmt.Println("El nombre de la mascota es: ", pet1)
	fmt.Println("El nombre de la mascota es: ", pet2)
	fmt.Println("El nombre de la mascota es: ", pet0)

	/** Range **/
	edades := map[string]int{"Ana": 30, "Carlos": 25, "Sofía": 28}

	for index, value := range primes {
		fmt.Printf("El valor de la posicion %d es: %d\n", index, value)
	}

	value := getvalue(true)

	strVal, ok := value.(string)

	if ok {
		fmt.Println("El valor es una cadena:", strVal)
	} else {
		fmt.Println("El valor no es una cadena")
	}

	fmt.Println("\nIterando sobre un map:")
	for nombre, edad := range edades {
		fmt.Printf("Nombre: %s, Edad: %d\n", nombre, edad)
	}

	/** Errprs/Panic/Recover **/

	result, err := dividir(10, 0)

	if err != nil {
		fmt.Println("Error:", err)
	} else {
		fmt.Println("Resultado:", result)
	}

	// Esto provocará un panic
	// accederIndice

	// Usando recover para manejar el panic

	manejarIndexFueraDeRango := func() {
		defer func() {
			if r := recover(); r != nil {
				fmt.Println("Recuperado de un panic:", r)
			}
		}()

		slice := []int{1, 2, 3}
		index := 5

		value := accederIndice(slice, index)

		fmt.Println("El valor en el índice", index, "es", value)
	}

	getUserById(1)

	LearnGoroutines()
	manejarIndexFueraDeRango()

	unCanal := make(chan int)

	go emisor(unCanal)
	go receptor(unCanal) // Si receptor va a consumir todos los datos, el for range en main no es necesario

	time.Sleep(time.Second * 3) // Espera a que las goroutines terminen
	fmt.Println("Fin del programa", userEmail)

	// var buffer bytes.Buffer

	// for i := 0; i < 1000; i++ {
	// 	buffer.WriteString("hola")
	// }
	// result := buffer.String()
	// // result contendrá "holaholahola..." 1000 veces

	// var buffer bytes.Buffer
	// err := binary.Write(&buffer, binary.BigEndian, int32(12345))
	//
	//	if err != nil {
	//	    fmt.Println("binary.Write failed:", err)
	//	}
	//
	// data := buffer.Bytes()
	// // data contendrá la representación binaria de 12345

	// Trabajar con peticiones y respuestas HTTP en pruebas: Puedes usar bytes.Buffer para simular el cuerpo de una petición o respuesta HTTP sin necesidad de conexiones de red reales.

	// select {
	// case <-canal1:
	//
	//	// Código a ejecutar si se recibe un valor de canal1
	//
	// case valor := <-canal2:
	//
	//	// Código a ejecutar si se recibe un valor de canal2, el valor recibido se asigna a 'valor'
	//
	// case canal3 <- valorToSend:
	//
	//	// Código a ejecutar si se puede enviar 'valorToSend' a canal3
	//
	// case <-time.After(3 * time.Second):
	//
	//	// Código a ejecutar si transcurren 3 segundos (útil para timeouts)
	//
	// default:
	//
	//	    // Código a ejecutar si ninguna de las otras operaciones está lista inmediatamente
	//	}

	aljksdha := make(chan string, 1)
	go longOperation(aljksdha)

	select {
	case res := <-aljksdha:
		fmt.Println("Resultado:", res)
	case <-time.After(1 * time.Second):
		fmt.Println("Timeout: La operación tardó demasiado.")
	}

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

func dividir(a, b int) (int, error) {
	if b == 0 {
		return 0, errors.New("no se puede dividir entre cero")
	}
	return a / b, nil
}

func accederIndice(slice []int, index int) int {
	if index < 0 || index >= len(slice) {
		panic("Índice fuera de rango")
	}

	return slice[index]
}

// En Go, un channel es un conducto a través del cual se pueden enviar y recibir valores entre goroutines.
func channelsInGo() {

	otroCanal := make(chan string)
	// otroCanalConBuffer := make(chan string, 20)

	myString := "Caarlos"

	// Envío: Se utiliza el operador <- para enviar un valor a un channel.

	otroCanal <- myString

	// Recepción: También se utiliza el operador <- para recibir un valor de un channel.
	valorRecibido := <-otroCanal // Recibe un valor del channel miCanal y lo asigna a valorRecibido
	fmt.Println("Valor recibido:", valorRecibido)

}

func emisor(c chan int) {
	defer close(c)
	fmt.Println("Emisor: Intentando enviar 1")
	c <- 1
	fmt.Println("Emisor: 1 enviado")

	fmt.Println("Emisor: Intentando enviar 2")
	c <- 2
	fmt.Println("Emisor: 2 enviado")
}

func receptor(c chan int) {
	time.Sleep(time.Second * 1) // Simula algún trabajo

	for valor := range c {
		fmt.Println("Recibido del canal:", valor)
	}

	fmt.Println("Receptor: Esperando recibir")
	valor1 := <-c
	fmt.Println("Receptor: Recibido", valor1)

	valor2 := <-c
	fmt.Println("Receptor: Recibido", valor2)
}

func longOperation(ch chan string) {
	time.Sleep(2 * time.Second)
	ch <- "Operación completada"

	scl := []int{1, 2, 3}
	strs := []string{"H", "ola"}

	Ejemplo(scl)
	Ejemplo(strs)

	NameFunc(4)
}

// La restricción comparable en Go asegura que el tipo T puede ser comparado con operadores como == o !=, pero no permite el uso de aserciones de tipo ni reflexión directa para inspeccionar el tipo en tiempo de ejecución.
func NameFunc[T comparable](n T) {

	switch reflect.TypeOf(n).Kind() {
	case reflect.Int:
		println("Es un entero:")
	case reflect.String:
		fmt.Println("Es un string:", n)
	}
	fmt.Println("n", n)
}

func Ejemplo[T comparable](slice []T) T {
	fmt.Println("Slices: ", slice)

	return slice[0]
}
