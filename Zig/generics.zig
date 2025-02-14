const std = @import("std");

// Lo anterior imprime { 1, 10, 100 }. La parte interesante es que tenemos una función que devuelve un type(por lo tanto, la función es PascalCase). No cualquier tipo, sino un tipo basado en un parámetro de función. Este código solo funcionó porque declaramos lengthcomo comptime. Es decir, requerimos que cualquiera que llame IntArraypase un lengthparámetro conocido en tiempo de compilación. Esto es necesario porque nuestra función devuelve un typey typessiempre debe ser conocida en tiempo de compilación.

// fn IntArray(comptime length: usize) type {
//     return [length]i64;
// }

// pub fn main() !void {
//     var list: IntArray(3) = undefined;

//     list[0] = 1;
//     list[1] = 10;
//     list[2] = 100;
//     std.debug.print("{any}\n", .{list});
// }

// Mas ordenado
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};

    const allocator = gpa.allocator();

    var arr = IntArray(3).init();
    arr.items[0] = 1;
    arr.items[1] = 10;
    arr.items[2] = 100;

    // Cuando se compila el código, el compilador crea un nuevo tipo buscando cada Ty reemplazándolo por u32. Si usamos List(u32)nuevamente, el compilador reutilizará el tipo que creó anteriormente. Si especificamos un nuevo valor para T, por ejemplo List(bool)o List(User), se crearán nuevos tipos.
    const list = try List(i64).init(allocator);
    // list.deinit() LIMPIAR ESPACIO

    std.debug.print("{any}\n", .{arr.items});
    std.debug.print("{any}\n", .{list});
}

fn IntArray(comptime length: usize) type {
    return struct {
        items: [length]i64,

        fn init() IntArray(length) {
            return .{
                .items = undefined,
            };
        }
    };
}

// Mas dinamico el tipo sera especificado según la instancia.
fn List(comptime T: type) type {
    return struct {
        pos: usize,
        items: []T,
        allocator: std.mem.Allocator,

        fn init(allocator: std.mem.Allocator) !List(T) {
            return .{
                .pos = 0,
                .allocator = allocator,
                .items = try allocator.alloc(T, 4),
            };
        }
    };
}

// EJEMPLO COMPLETO DE USO DE GENERIC Y ASIGNACION DE MEMORIA.
// const std = @import("std");
// const Allocator = std.mem.Allocator;

// pub fn main() !void {
// 	var gpa = std.heap.GeneralPurposeAllocator(.{}){};
// 	const allocator = gpa.allocator();

// 	var list = try List(u32).init(allocator);
// 	defer list.deinit();

// 	for (0..10) |i| {
// 		try list.add(@intCast(i));
// 	}

// 	std.debug.print("{any}\n", .{list.items[0..list.pos]});
// }

// fn List(comptime T: type) type {
// 	return struct {
// 		pos: usize,
// 		items: []T,
// 		allocator: Allocator,

// 		fn init(allocator: Allocator) !List(T) {
// 			return .{
// 				.pos = 0,
// 				.allocator = allocator,
// 				.items = try allocator.alloc(T, 4),
// 			};
// 		}

// 		fn deinit(self: List(T)) void {
// 			self.allocator.free(self.items);
// 		}

// 		fn add(self: *List(T), value: T) !void {
// 			const pos = self.pos;
// 			const len = self.items.len;

// 			if (pos == len) {
// 				// we've run out of space
// 				// create a new slice that's twice as large
// 				var larger = try self.allocator.alloc(T, len * 2);

// 				// copy the items we previously added to our new space
// 				@memcpy(larger[0..len], self.items);

// 				self.allocator.free(self.items);

// 				self.items = larger;
// 			}

// 			self.items[pos] = value;
// 			self.pos = pos + 1;
// 		}
// 	};
// }

// USO DE Self
// Self no es un nombre especial, es solo una variable y es PascalCase porque su valor es un type. Podemos usar Selfdonde habíamos usado previamente List(T).
// fn List(comptime T: type) type {
// 	return struct {
// 		pos: usize,
// 		items: []T,
// 		allocator: Allocator,

// 		// Added
// 		const Self = @This();

// 		fn init(allocator: Allocator) !Self {
// 			// ... same code
// 		}

// 		fn deinit(self: Self) void {
// 			// .. same code
// 		}

// 		fn add(self: *Self, value: T) !void {
// 			// .. same code
// 		}
// 	};
// }