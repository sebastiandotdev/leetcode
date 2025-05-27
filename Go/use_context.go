package main

import (
	"context"
	"fmt"
)

/*
El paquete context te permite tener un contexto sobre la operación que se está ejecutando en un momento dado. Este contexto puede llevar información asociada a esa operación (como un ID de rastreo) y también puede ser utilizado para señalar que la operación debe ser cancelada (ya sea por un timeout o porque el cliente desconectó).

La idea principal es gestionar el ciclo de vida de las operaciones, especialmente en entornos concurrentes como servidores web, para evitar seguir procesando peticiones que ya no son relevantes o que están tardando demasiado, ahorrando así recursos y mejorando la resiliencia de la aplicación.

En esencia, te da la capacidad de tener una "conciencia" del estado de la operación y de influir en su ejecución basándose en ese estado o en señales externas.
*/

func operarEjemplo(ctx context.Context) {
	fmt.Println("Iniciando operación...")
	// Aquí normalmente harías trabajo, verificando ctx.Done() si fuera una tarea larga.
	fmt.Println("Operación en curso...")
	fmt.Println("Operación finalizada (sin cancelación activa en este ejemplo simple).")
}

func LearnUseContext() {
	// 1. Contexto básico (context.Background()):
	// Se le conoce como contexto raiz en donde derivan otros contextos.
	backgroundCtx := context.Background()
	fmt.Println("Background Context:", backgroundCtx)

	// 2. Contexto con cancelación (context.WithCancel()):
	cancelCtx, cancelFunc := context.WithCancel(backgroundCtx)

	defer cancelFunc() // Asegúrate de llamar a cancelFunc para liberar recursos.

	fmt.Println("Contexto padre:", backgroundCtx)
	fmt.Println("Contexto hijo:", cancelCtx)

	operarEjemplo(cancelCtx)
	fmt.Println("Simulando cancelación del contexto hijo...")
	cancelFunc()
	// En este ejemplo síncrono, 'operar' ya habrá terminado antes de la cancelación.
	// En un escenario con goroutines, la cancelación señalaría que la operación debe detenerse.
}

/*
Usos clave del context en un servidor Go:

Cancelación de operaciones: Si un cliente cierra la conexión antes de que tu servidor termine de procesar la petición (por ejemplo, el usuario cierra la pestaña del navegador), el context asociado a esa petición se puede cancelar. Esto te permite detener cualquier operación en curso relacionada con esa petición (consultas a bases de datos, llamadas a otros servicios) y evitar el desperdicio de recursos.

Imagina que estás consultando múltiples bases de datos para responder a una petición. Si el cliente cancela la petición a mitad de camino, no tiene sentido seguir esperando las respuestas de las bases de datos restantes. El context te permite señalar a esas operaciones que deben detenerse.

Timeouts: Puedes establecer un tiempo límite para el procesamiento de una petición. Si la petición tarda demasiado, el context se cancela automáticamente por timeout, y puedes devolver un error al cliente en lugar de quedarte esperando indefinidamente. Esto ayuda a que tu servidor sea más resiliente.

Propagación de información de la petición: Puedes adjuntar valores al context que son específicos de una petición, como el ID del usuario autenticado, el ID de la petición para logs, o información de seguimiento. Esto evita tener que pasar estos valores explícitamente a través de múltiples funciones.
*/
