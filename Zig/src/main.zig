const std = @import("std");
const debug = @import("std").debug;

pub fn main() void {
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
}
