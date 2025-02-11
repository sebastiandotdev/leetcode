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

    std.debug.print("{s}\n", .{great});
    std.debug.print("{any}\n", .{std.mem.asBytes(&a).*});
}
