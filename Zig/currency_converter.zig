const std = @import("std");

const io = std.io;
const mem = std.mem;

// u8: Representa un byte individual (un entero sin signo de 8 bits). Cuando se usa en un slice como []u8, significa que tienes un slice de bytes mutables. Esto significa que potencialmente puedes modificar los bytes individuales dentro de ese slice.
//  var buffer: [5]u8 = [_]u8{ 'h', 'e', 'l', 'l', 'o' }; // Buffer mutable
//     var slice: []u8 = buffer[0..]; // Slice mutable que apunta al buffer

//     std.debug.print("Original: {s}\n", .{slice}); // Imprime "hello"

//     // Modificar el primer byte
//     slice[0] = 'H';

//     std.debug.print("Modificado: {s}\n", .{slice}); // Imprime "Hello"

//     // Modificar el último byte
//     slice[4] = '!';

//     std.debug.print("Modificado: {s}\n", .{slice}); // Imprime "Hell!"

//     std.debug.print("Buffer original: {s}\n", .{buffer[0..]}); // Imprime "Hell!"

// const u8: Representa un byte individual que es inmutable (constante). Cuando se usa en un slice como []const u8, significa que tienes un slice de bytes inmutables. No puedes modificar los bytes individuales dentro de ese slice.

//  var buffer: [5][]const u8 = .{ 'h', 'e', 'l', 'l', 'o' }; // Buffer inmutable

//     ERROR
//     buffer[0] = 'H';

const WHITESPACE_DELIMITERS: [2]u8 = .{ '\r', '\n' };

pub fn main() !void {
    const supported_currencies: [3][]const u8 = .{ "EUR", "COP", "USD" };

    var local_currency_buffer: [1024]u8 = undefined;
    var currency_buffer_to_convert: [1024]u8 = undefined;

    const stdin = io.getStdIn().reader();

    std.debug.print("Ingrese su moneda local: ", .{});
    const local_currency_bytes = try stdin.readUntilDelimiter(&local_currency_buffer, '\n');
    const local_currency = mem.trim(u8, local_currency_bytes, &WHITESPACE_DELIMITERS);

    std.debug.print("Ingrese la moneda a convertir: ", .{});
    const currency_to_convert_bytes = try stdin.readUntilDelimiter(&currency_buffer_to_convert, '\n');

    for (supported_currencies) |value| {
        if (mem.eql(u8, value, local_currency)) {
            std.debug.print("La moneda local esta disponible\n", .{});
            break;
        }
    }

    std.debug.print("{s} - {s}\n", .{ local_currency_bytes, currency_to_convert_bytes });
    std.debug.print("{*}\n", .{local_currency.ptr});
}

// 1. Un Carácter ('A') en Memoria

// - 'A': En Zig (y en muchos otros lenguajes), un carácter como 'A' se representa internamente como un número entero. Este número corresponde al punto de código del carácter en una codificación de caracteres específica.
// u8 y ASCII/UTF-8:
// - Si estás usando caracteres ASCII (que solo incluye caracteres básicos del inglés, números y algunos símbolos), entonces un u8 es suficiente para representar cada carácter. El valor numérico de 'A' en ASCII es 65.
// - Si estás usando UTF-8, un solo carácter puede requerir más de un byte (es decir, más de un u8) para su representación. Los caracteres ASCII se representan con un solo byte en UTF-8, pero los caracteres de otros idiomas (como el español, el francés, el chino, etc.) pueden requerir 2, 3 o incluso 4 bytes.
// En resumen: Un carácter individual se representa como un número entero (generalmente un u8 para ASCII o múltiples u8 para UTF-8).

// 2. Un String Literal ("Hello") en Memoria

// - "Hello": Un string literal como "Hello" se representa como una secuencia contigua de bytes en memoria, terminada (implícitamente) por un byte nulo (\0) en C-style strings, aunque Zig no usa null termination por defecto.
// - UTF-8: En Zig, los strings literales se asumen que están codificados en UTF-8. Por lo tanto, cada carácter en el string se representa con uno o más bytes, dependiendo del carácter.
// - Ejemplo: El string "Hello" se representaría en memoria como los bytes [72, 101, 108, 108, 111] (en decimal), que corresponden a los códigos ASCII de las letras 'H', 'e', 'l', 'l', 'o'. Si el string contuviera caracteres no ASCII, la representación sería más compleja.

// 3. const supported_currencies: [3][]const u8 = .{ "EUR", "COP", "USD" };

// Aquí es donde se pone interesante. Vamos a analizar esta declaración:

// - [3][]const u8: Esto significa "un array de 3 elementos, donde cada elemento es un slice inmutable de bytes".
// { "EUR", "COP", "USD" }: Esto es un array literal que contiene tres strings literales.

// Cómo se representa en memoria:
// - Strings Literales: Los strings "EUR", "COP" y "USD" se almacenan en memoria como secuencias contiguas de bytes UTF-8 (en este caso, ASCII, ya que solo contienen caracteres ASCII).
// - Array de Slices: El array supported_currencies no contiene directamente los bytes de los strings. En cambio, contiene slices que apuntan a las ubicaciones de memoria donde se almacenan los strings literales. Un slice es esencialmente un puntero a un array de bytes, junto con la longitud del array.

// supported_currencies: [
//     { pointer_to_"EUR", length: 3 },
//     { pointer_to_"COP", length: 3 },
//     { pointer_to_"USD", length: 3 }
// ]

// "EUR": [69, 85, 82]  // Bytes en memoria
// "COP": [67, 79, 80]  // Bytes en memoria
// "USD": [85, 83, 68]  // Bytes en memoria

// UTF-8 es una codificación de caracteres que usa de 1 a 4 bytes para representar cada carácter. Es compatible con ASCII y puede representar casi todos los caracteres de todos los idiomas. En Zig, los strings se asumen que están codificados en UTF-8.
