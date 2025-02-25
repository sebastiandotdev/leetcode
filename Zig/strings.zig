const std = @import("std");

// En Zig, las cadenas no son un tipo primitivo como en otros lenguajes. En realidad, son una secuencia de bytes almacenados en memoria.
// Esta secuencia de bytes generalmente representa caracteres en formato UTF-8, que es un estándar para codificar caracteres Unicode.
// Cuando ves *const [11:0] u8, estás viendo una declaración de un puntero.

// *: Indica que es un puntero. Un puntero es una variable que almacena una dirección de memoria.
// const: Significa que el valor al que apunta el puntero no se puede modificar.
// [11:0]: Especifica que el puntero apunta a una matriz de 11 bytes. El 0 indica que la matriz está alineada a 0 bytes, lo cual es común para cadenas.
// u8: Indica que cada elemento de la matriz es un entero sin signo de 8 bits (un byte).

// Entonces, *const [11:0] u8 declara un puntero a una matriz de 11 bytes constantes.
// Esta matriz de bytes puede contener una cadena de texto, pero no es una cadena en sí misma, sino una representación de bytes de la cadena.

pub fn main() void {
    const a: [3:false]bool = .{ false, true, false };

    const great = "Hello, word"; // *const [11:0]u8
    const s = great.*;

    std.debug.print("{s}\n", .{great});
    std.debug.print("{s}\n", .{s});
    std.debug.print("{any}\n", .{std.mem.asBytes(&a).*});
}

// Cuando digo " pointer_to_"EUR" es la dirección de memoria donde comienza el string "EUR" ", me refiero a lo siguiente:

// Memoria: Imagina la memoria de tu computadora como una larga secuencia de bytes, cada uno con su propia dirección única (como los números de las casas en una calle).
// String Literal en Memoria: Cuando defines un string literal como "EUR", el compilador de Zig reserva un espacio en la memoria para almacenar los bytes que representan ese string (en este caso, los bytes 69, 85 y 82, que corresponden a 'E', 'U' y 'R' en ASCII/UTF-8). Estos bytes se almacenan en ubicaciones de memoria contiguas.
// Dirección de Memoria: Cada byte en la memoria tiene una dirección única. La dirección de memoria donde comienza el string "EUR" es la dirección del primer byte de ese string (en este caso, el byte 69 que representa la letra 'E').
// Puntero: Un puntero es una variable que almacena una dirección de memoria. En el caso de pointer_to_"EUR", esta variable almacena la dirección de memoria donde comienza el string "EUR".
// Analogía:

// Imagina que tienes un libro (el string "EUR") y cada página del libro tiene un número (la dirección de memoria). El puntero pointer_to_"EUR" es como un índice que te dice en qué página (dirección de memoria) comienza el libro "EUR".

// En Zig:

// Cuando creas un slice de un string literal, el slice almacena dos cosas:

// La dirección de memoria donde comienza el string.
// La longitud del string (el número de bytes que contiene).
