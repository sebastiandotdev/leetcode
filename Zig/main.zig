const std = @import("std");

const debug = std.debug;
const mem = std.mem;

fn foo() void {
    var y: i32 = 10;

    y += 1;

    debug.print("{}\n", .{y});
}

pub fn main() void {
    // Here we will write new things learned from Zig with basic examples
    debug.print("Hello world\n", .{});

    // Integers
    const one_plus_one: i32 = 1 + 1;
    debug.print("{}\n", .{one_plus_one});

    // Floats
    const seven_div_three: f32 = 7.0 / 3.0;
    debug.print("{}\n", .{seven_div_three});

    // Booleans
    debug.print("{}\n {}\n {}\n", .{ true and false, true or false, !true });

    // Optional
    var optional_value: ?[]const u8 = null;

    debug.assert(optional_value == null);
    debug.print("No optional value\n: type {}\nvalue: {?s}\n", .{ @TypeOf(optional_value), optional_value });

    optional_value = "hi";
    debug.assert(optional_value != null);

    debug.print("TYPE NEW:\n {}\nvalue: {?s}\n", .{ @TypeOf(optional_value), optional_value });

    // error union
    var number_or_error: anyerror!i32 = error.ArgNotFound;

    debug.print("\nerror union 1\ntype: {}\nvalue: {!}\n", .{
        @TypeOf(number_or_error),
        number_or_error,
    });

    number_or_error = 32;
    debug.print("\nerror union 2\type: {}\nvalue {!}", .{ @TypeOf(number_or_error), number_or_error });

    const bytes = "Hola, Mundo";

    debug.print("{}\n", .{@TypeOf(bytes)}); // imprime tipo de dat
    debug.print("{d}\n", .{bytes.len}); // logintud
    debug.print("{c}\n", .{bytes[1]}); // para imprimir el caracter
    debug.print("{c}\n", .{bytes[5]}); // para imprimir decimales
    debug.print("{}\n", .{mem.eql(u8, "hello", "h\x65llo")});

    foo();

    var x: i32 = undefined;

    x = 10;

    debug.print("{}\n", .{x});
}

fn addOne(num: i32) i32 {
    return num + 1;
}

// Dos forma de hacer pruebas

test "Expect addOne adds one to 41" {
    try std.testing.expect(addOne(41) == 42);
}

// Example test failed
// test "expect this to fail" {
//     try std.testing.expect(false);
// }

test "Skipped test" {
    return error.SkipZigTest;
}

test addOne {
    // A test name can also be written using an identifier.
    // This is a doctest, and serves as documentation for `addOne`.
    try std.testing.expect(addOne(41) == 42);
}
