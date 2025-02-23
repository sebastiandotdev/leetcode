// "Un recolector de basura es un proceso automático que se encarga de liberar la memoria que ya no está siendo utilizada por un programa. Cuando un programa utiliza un espacio de memoria, es decir, asigna memoria a variables, objetos u otros elementos, este espacio debe liberarse una vez que ya no es necesario. El recolector de basura identifica y libera automáticamente esta memoria, lo que evita que el programador tenga que hacerlo manualmente. Esto simplifica la programación, reduce la posibilidad de errores y optimiza el uso de los recursos del sistema."

// IMPORTANT: Cuando le pases un argumento a una funcion de forma predeterminada Zig le pasará una copia del dato que intentas manipular internamente en la funcion.
const std = @import("std");

// Pero para los programas que se ejecutan durante días, meses o incluso años, la memoria se convierte en un recurso limitado y preciado, que probablemente busquen otros procesos que se ejecutan en la misma máquina. Simplemente no hay forma de esperar hasta que el programa salga para liberar memoria. Esta es la tarea principal de un recolector de basura: saber qué datos ya no se utilizan y liberar su memoria. En Zig, usted es el recolector de basura.
pub fn main() !void {
    var user = User{
        .id = 1,
        .power = 100,
    };

    std.debug.print("{*}\n{*}\n{*}\n", .{ &user, &user.id, &user.power });

    // const user_p = &user; // *User

    // added this
    std.debug.print("main: {*}\n", .{&user});
    // this line has been added
    user.levelUp();
    std.debug.print("User {d} has power of {d}\n", .{ user.id, user.power });

    try exercismWithAllocator();
}

pub const User = struct {
    id: u64,
    power: i32,

    pub fn levelUp(user: *User) void {
        std.debug.print("levelUp: {*}\n", .{&user});

        user.power += 1;
    }
};

// Diferencia entre números con signo (signed) y sin signo (unsigned)
// Los números enteros en programación pueden clasificarse en dos tipos principales:

// Números con signo (signed):

// Pueden representar valores negativos y positivos.
// Ejemplo en i32 (entero con signo de 32 bits):
// Rango: −2,147,483,648 a 2,147,483,647.
// Números sin signo (unsigned):

// Solo representan valores positivos.
// Ejemplo en u32 (entero sin signo de 32 bits):
// Rango: 0 a 4,294,967,295.

// “### **Resumen**
// | Lenguaje | `const` afecta la referencia | `const` hace inmutable el contenido | | --- | --- | --- |
// | TypeScript | ✅ No puedes reasignar la variable | ❌ El contenido sigue siendo mutable |
// | Zig | ✅ No puedes reasignar la variable | ✅ También impide modificar su contenido | Si en Zig **quieres que el contenido sea mutable**, usa `var`. 🚀”

fn exercismWithAllocator() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const array_of_numbers: [10]i32 = .{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

    var numbers_pars = std.ArrayList(i32).init(allocator);
    var numbers_impars = std.ArrayList(i32).init(allocator);

    defer numbers_pars.deinit();
    defer numbers_impars.deinit();

    const NUMBER_BASE: i32 = 2;

    for (array_of_numbers) |value| {
        if (@rem(value, NUMBER_BASE) == 0) {
            try numbers_pars.append(value);
        } else {
            try numbers_impars.append(value);
        }
    }

    std.debug.print("Estos son los números pares: {any}\n", .{numbers_pars.items});
    std.debug.print("Estos son los números impares: {any}\n", .{numbers_impars.items});
}

// Cuando imprimes un std.ArrayList(i32), ves algo así:
// array_list.ArrayListAligned(i32,null){
//     .items = { 2, 4, 6, 8, 10 },
//     .capacity = 8,
//     .allocator = mem.Allocator{
//         .ptr = anyopaque@7ff7b1ccadc0,
//         .vtable = mem.Allocator.VTable{
//             .alloc = fn (*anyopaque, usize, u8, usize) ?[*]u8@10e238470,
//             .resize = fn (*anyopaque, []u8, u8, usize, usize) bool@10e238680,
//             .free = fn (*anyopaque, []u8, u8, usize) void@10e239360
//         }
//     }
// }
