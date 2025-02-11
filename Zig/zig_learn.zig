const debug = @import("std").debug;
const user = @import("user.zig");

const MAX_POWER = user.MAX_POWER;
const User = user.User;

fn add(a: i64, b: i64) i64 {
    return a + b;
}

// TIP: Las funciones que empiezan por `@` las proporcina el compilador no la biblioteca estandar
pub fn main() void {
    const sum = add(100, 200);

    const new_user = User{
        .power = 9001,
        .name = "Goku",
    };

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
