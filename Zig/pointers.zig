// "Un recolector de basura es un proceso automático que se encarga de liberar la memoria que ya no está siendo utilizada por un programa. Cuando un programa utiliza un espacio de memoria, es decir, asigna memoria a variables, objetos u otros elementos, este espacio debe liberarse una vez que ya no es necesario. El recolector de basura identifica y libera automáticamente esta memoria, lo que evita que el programador tenga que hacerlo manualmente. Esto simplifica la programación, reduce la posibilidad de errores y optimiza el uso de los recursos del sistema."

// IMPORTANT: Cuando le pases un argumento a una funcion de forma predeterminada Zig le pasará una copia del dato que intentas manipular internamente en la funcion.
const std = @import("std");

pub fn main() void {
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
}

pub const User = struct {
    id: u64,
    power: i32,

    pub fn levelUp(user: *User) void {
        std.debug.print("levelUp: {*}\n", .{&user});

        user.power += 1;
    }
};
