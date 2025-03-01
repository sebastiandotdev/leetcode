const std = @import("std");

const io = std.io;
const mem = std.mem;

pub fn main() !void {
    const stdin = io.getStdIn().reader();

    var buffer: [10]u8 = undefined;

    std.debug.print("Escribe el número a identificar: ", .{});
    const input = try stdin.readUntilDelimiterOrEof(&buffer, '\n') orelse {
        std.debug.print("No se recibió entrada.\n", .{});
        return;
    };

    const number = std.fmt.parseInt(u8, input, 10) catch |err| {
        std.debug.print("Error: Ingresa un número válido. Error: {}\n", .{err});
        return;
    };

    if (number % 2 == 0) {
        std.debug.print("El numero: {} es PAR\n", .{number});
    } else {
        std.debug.print("El numero: {} no es PAR\n", .{number});
    }
}
