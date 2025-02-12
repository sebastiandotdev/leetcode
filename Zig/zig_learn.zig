const debug = @import("std").debug;
const user = @import("user.zig");

// El código fuente de Zig tiene una sangría de cuatro espacios. Personalmente, utilizo una tabulación que objetivamente es mejor para la accesibilidad.

// Los nombres de las funciones son camelCase y las variables son snake_case. Los tipos son PascalCase. Existe una intersección interesante entre estas tres reglas. Las variables que hacen referencia a un tipo, o las funciones que devuelven un tipo, siguen la regla del tipo y son PascalCase. Ya vimos esto, aunque es posible que no lo hayas notado.

const MAX_POWER = user.MAX_POWER;

const User = user.User;

// Hemos visto otras funciones incorporadas: @import, @remy @intCast. Dado que son funciones, son camelCase. @TypeOftambién es una función incorporada, pero es PascalCase, ¿por qué? Porque devuelve un tipo y, por lo tanto, se utiliza la convención de nombres de tipos. Si tuviéramos que asignar el resultado de @TypeOfa una variable, utilizando la convención de nombres de Zig, esa variable también debería ser PascalCase:

fn add(a: i64, b: i64) i64 {
    const T = @TypeOf(3);
    debug.print("{any}\n", .{T});
    return a + b;
}

// TIP: Las funciones que empiezan por `@` las proporcina el compilador no la biblioteca estandar
pub fn main() void {
    const sum = add(100, 200);

    const new_user = User{
        .power = 9001,
        .name = "Goku",
    };

    _ = add(10, 20);
    const user_convetional: User = .{ .power = 9002, .name = "Broly" };

    const optional_power_user = User{ .name = "Vegeta" };

    user_convetional.diagnose();
    new_user.diagnose();

    // Tenga en cuenta que este error solo se produjo porque usamos var.
    //Si hubiéramos usado const, no habríamos tenido el error, ya
    //que el objetivo del error es que a comptime_int debe ser constante.
    // var number = 10; // ERROR
    const number = 10;
    debug.print("NUMERO COMPTIME_INT: {d}\n", .{number});

    debug.print("{any}\n", .{@TypeOf(.{ .month = 2, .year = 2025 })});
    debug.print("{s}", .{optional_power_user.name});
    debug.print("{s}'s power is {d}\n", .{ new_user.name, new_user.power });
    debug.print("8999 + 2 = {d}\n", .{sum});
}
