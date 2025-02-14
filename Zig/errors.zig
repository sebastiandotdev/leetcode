const std = @import("std");

const OpenError = error{
    AccessDenied,
    NotFound,
};

pub const Save = struct {
    lives: u8,
    level: u16,

    pub fn loadLast() !?Save {
        return null;
    }

    pub fn blank() Save {
        return .{
            .lives = 3,
            .level = 1,
        };
    }
};

pub fn throwError() OpenError {
    return OpenError.NotFound;
}

pub fn main() !void {
    const save = (try Save.loadLast()) orelse Save.blank();

    throwError();
    std.debug.print("{any}\n", .{save});
}
