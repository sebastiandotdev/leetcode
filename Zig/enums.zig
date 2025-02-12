const std = @import("std");

const debug = std.debug;

// Las enumeraciones (enums) en Zig son una forma de definir un tipo de dato que solo puede tener uno de varios valores posibles.
// Cada uno de estos valores se llama un "caso" o "miembro" de la enumeración.
const Status = enum { ok, bad, unknow };

const Stage = enum {
    validate,
    awaiting_confirmation,
    confirmed,
    err,

    fn is_complete(self: Stage) bool {
        return self == .confirmed or self == .err;
    }

    fn to_string(self: Stage) []const u8 {
        return switch (self) {
            .validate => "Validacion",
            .awaiting_confirmation => "Esperando confirmación",
            .confirmed => "Confirmado",
            .err => "Error",
        };
    }
};

pub fn main() void {
    const stage = Stage.awaiting_confirmation;

    debug.print("Etapa actual: {}\n", .{stage.to_string()});

    if (stage.is_complete()) {
        debug.print("El proceso ha terminado.\n", .{});
    } else {
        debug.print("El proceso aún no ha terminado.\n", .{});
    }

    debug.print("{s}\n", .{"Hello, world"});
}
