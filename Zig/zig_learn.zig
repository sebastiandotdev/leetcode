const std = @import("std");

const User = struct {
    power: u64,
    name: []const u8,
};

fn add(a: i64, b: i64) i64 {
    return a + b;
}

fn main() void {
    const sum = add(100, 200);

    const user = User{
        .power = 9001,
        .name = "Goku",
    };

    std.debug.print("{s}'s power is {d}\n", .{ user.name, user.power });
    std.debug.print("8999 + 2 = {d}\n", .{sum});
}
