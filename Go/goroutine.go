package main

import (
	"fmt"
	"time"
)

/*
Una goroutine es una función que puede ejecutarse concurrentemente con otras funciones. Piensa en ella como una forma de hacer que tu programa haga varias cosas "al mismo tiempo". Go facilita mucho la creación y gestión de goroutines.
*/

func decirhola() {
	println("Hola desde una goroutine")
}

func LearnGoroutines() {

	// La palabra clave para iniciar una goroutine es go seguida de la llamada a una función.

	fmt.Println("Antes de iniciar la goroutine")
	go decirhola() // Inicia la goroutine
	fmt.Println("Después de iniciar la goroutine")

	// Damos un pequeño tiempo para que la goroutine tenga la oportunidad de ejecutarse.
	time.Sleep(time.Second)

	fmt.Println("Inicio.")
	go imprimir("Hola", 5)  // Inicia una goroutine
	go imprimir("Mundo", 5) // Inicia otra goroutine

	fmt.Println("Esperando que las goroutines terminen (de forma burda).")
	time.Sleep(time.Second * 1) // Esperamos un tiempo suficiente para que las goroutines terminen.

	fmt.Println("Fin.")
}

func imprimir(mensaje string, n int) {
	for i := 0; i < n; i++ {
		fmt.Println((i + 1), ":", mensaje)
		time.Sleep(time.Millisecond * 100) // Pequeña pausa para ver la concurrencia
	}
}

/*
Cuando lanzas una función con la palabra clave go, esa función comienza a ejecutarse independientemente del flujo principal de tu programa. Esto significa que la función que lanzó la goroutine no espera a que la goroutine termine para continuar con su propia ejecución.
*/

/*
Casos de uso comunes de goroutines:

Operaciones de E/S: Cuando tu programa necesita esperar una operación de entrada/salida (como leer de un archivo, hacer una petición de red, consultar una base de datos), puedes ejecutar esa operación en una goroutine para que el resto de tu programa pueda seguir funcionando. Una vez que la operación de E/S se completa, la goroutine puede comunicar el resultado.
Tareas en segundo plano: Cualquier tarea que no necesite bloquear la ejecución principal de tu programa puede ser candidata para una goroutine (por ejemplo, un proceso de limpieza, un monitor, un recolector de estadísticas).
Procesamiento paralelo: Si tienes una tarea que se puede dividir en subtareas independientes, puedes asignar cada subtarea a una goroutine para acelerar el procesamiento total.



Casos en donde NO se recomienda usar goroutines (o buenas prácticas a considerar):

Tareas muy cortas y no bloqueantes: Si una tarea es extremadamente rápida y no implica espera, el overhead de crear y gestionar una goroutine podría ser mayor que el beneficio de la concurrencia. En estos casos, a menudo es más eficiente ejecutar la tarea directamente.
Sin mecanismos de sincronización: Si múltiples goroutines acceden a recursos compartidos (como variables o estructuras de datos), debes usar mecanismos de sincronización (como mutexes, aunque pediste que no los mencionara por ahora) para evitar condiciones de carrera y otros comportamientos inesperados. Lanzar goroutines sin pensar en cómo se coordinarán puede llevar a errores difíciles de depurar.
Creación descontrolada de goroutines: Lanzar una gran cantidad de goroutines sin limitación puede consumir muchos recursos del sistema (memoria, CPU) y potencialmente llevar a problemas de rendimiento o incluso a que el programa se quede sin recursos. Es importante controlar el número de goroutines que se crean, especialmente en aplicaciones que manejan muchas peticiones concurrentes.

*/
