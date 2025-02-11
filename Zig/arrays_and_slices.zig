const std = @import("std");

// Slices en Zig
// Ejemplo del marcapáginas
// Digamos que tienes un libro con el texto: "El perro ladra".

// Puntero: Apunta al inicio de la palabra "perro".
// Longitud: 5 (porque "perro" tiene 5 letra

pub fn main() void {
    var a = [5]i32{ 1, 2, 3, 4, 5 };

    // Con diferente Sintax
    const b: [5]i32 = .{ 1, 2, 3, 4, 5 };

    // Slices
    // Puedes tener múltiples slices que apunten a diferentes partes de la misma cadena (o array de bytes).
    const pointer_value = a[1..4];

    // Inferencia en la longitud durante tiempo de compilación
    const c = [_]i32{ 1, 2, 3, 4, 5 };

    const slice_mut = a[0..2];

    slice_mut[0] = 99;

    std.debug.print("Types mutable slice: {d}\n", .{slice_mut[0]});

    // Dará un error en tiempo de compilación ya que `pointer_value` al final esta apuntando a la longitud de la variable `a`
    // Y a es una matriz de numeros contantes para lograr que esta linea funcione debemos cambiar `const` por `var`  en la variable `a`
    // Pero la constancia de b se relaciona consigo misma, no con los datos a los que apunta.
    // pointer_value[0] = 99;

    // b = b[1..]; Esto no funciona por que `b` es `const`

    std.debug.print("Types: {} {} {}\n", .{ @TypeOf(a), @TypeOf(b), @TypeOf(c) });
    std.debug.print("{any}", .{pointer_value});
}
