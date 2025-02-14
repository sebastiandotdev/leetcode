const std = @import("std");

// La principal ventaja de usar usize en lugar de un tipo de entero de tamaño fijo (como u32 o u64) es que se adapta automáticamente al tamaño de la memoria en la arquitectura en la que se compila el programa. Esto hace que el código sea más portable y eficiente, ya que no es necesario preocuparse por el tamaño específico de la memoria al trabajar con tamaños o índices.

fn getRamdonCount() !u8 {
    var seed: u8 = undefined;
    try std.posix.getrandom(std.mem.asBytes(&seed));

    var ramdon = std.Random.DefaultPrng.init(seed);

    return ramdon.random().uintAtMost(u8, 5) + 5;
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var arr = try allocator.alloc(usize, try getRamdonCount());
    // allocator.alloc(comptime T: type, n: usize)
    defer allocator.free(arr);

    // La última línea de este código es profética: no se imprimirá.
    // Esto se debe a que usamos freela misma memoria dos veces.
    // Esto se conoce como doble liberación y no es válido.
    // Puede parecer bastante fácil de evitar, pero en proyectos grandes con tiempos de vida complejos, puede ser difícil de rastrear.
    // allocator.free(arr);
    // allocator.free(arr);

    for (0..arr.len) |index| {
        arr[index] = index;
    }

    std.debug.print("{any}\n", .{arr});
}

// La segunda regla es que no se puede liberar memoria a la que no se tiene una referencia. Puede parecer obvio, pero no siempre está claro quién es responsable de liberarla. Lo siguiente crea una nueva cadena en minúsculas:

// const std = @import("std");
// const Allocator = std.mem.Allocator;

// fn allocLower(allocator: Allocator, str: []const u8) ![]const u8 {
// 	var dest = try allocator.alloc(u8, str.len);

// 	for (str, 0..) |c, i| {
// 		dest[i] = switch (c) {
// 			'A'...'Z' => c + 32,
// 			else => c,
// 		};
// 	}

// 	return dest;
// }

// For this specific code, we should have used std.ascii.eqlIgnoreCase
// Esto es una pérdida de memoria. La memoria creada en allocLowernunca se libera. No solo eso, sino que una vez isSpecialque regresa, nunca se puede liberar. En lenguajes con recolectores de basura, cuando los datos se vuelven inaccesibles, eventualmente serán liberados por el recolector de basura. Pero en el código anterior, una vez que isSpecialregresa, perdemos nuestra única referencia a la memoria asignada, la lowervariable. La memoria se pierde hasta que nuestro proceso finaliza. Nuestra función puede perder solo unos pocos bytes, pero si es un proceso de larga ejecución y esta función se llama repetidamente, se acumulará y eventualmente nos quedaremos sin memoria.
// fn isSpecial(allocator: Allocator, name: [] const u8) !bool {
// 	const lower = try allocLower(allocator, name);
// 	return std.mem.eql(u8, lower, "admin");
// }
