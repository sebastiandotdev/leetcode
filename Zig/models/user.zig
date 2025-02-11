const debug = @import("std").debug;

pub const MAX_POWER = 100_00;

pub const User = struct {
    name: []const u8,
    power: u64 = 0,

    pub const SUPER_POWER = 9000;

    pub fn init(name: []const u8, power: u64) User {
        return .{ .name = name, .power = power };
    }

    pub fn diagnose(user: User) void {
        if (user.power >= SUPER_POWER) {
            debug.print("i'ts over {d}!!", .{SUPER_POWER});
        }
    }
};
