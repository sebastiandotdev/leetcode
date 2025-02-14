const std = @import("std");
const builtin = @import("builtin");

const Allocator = std.mem.Allocator;
const io = std.io;

const User = struct {
    name: []const u8,
    power: i32,

    const Self = @This();

    pub fn deinit(self: Self, allocator: Allocator) void {
        allocator.free(self.name);
    }
};

fn userFactory(data: anytype) User {
    const T = @TypeOf(data);
    return .{
        .power = if (@hasField(T, "power")) data.power else 0,
        .name = if (@hasField(T, "name")) data.name else "",
    };
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var arr = std.ArrayList(User).init(allocator);
    var out = std.ArrayList(u8).init(allocator);

    defer out.deinit();
    defer {
        for (arr.items) |user| {
            user.deinit(allocator);
        }
        arr.deinit();
    }

    const stdin = io.getStdIn().reader();
    const stdout = io.getStdOut().writer();

    var index: i32 = 0;

    while (true) : (index += 1) {
        var buf: u8 = undefined;

        try stdout.print("Please enter a name: ", .{});

        if (try stdin.readUntilDelimiterOrEof(&buf, '\n')) |line| {
            var name = line;

            if (builtin.os.tag == .windows) {
                name = @constCast(std.mem.trimRight(u8, name, "\r"));
            }

            if (name.len == 0) {
                break;
            }

            const owned_name = try allocator.dupe(u8, name);

            try arr.append(.{ .name = owned_name, .power = index });
        }
    }

    var has_leto = false;

    for (arr.items) |user| {
        if (std.mem.eql(u8, "Leto", user.name)) {
            has_leto = true;
            break;
        }
    }

    try std.json.stringify(.{
        .this_is = "an anonymous struct",
        .above = true,
        .last_param = "are options",
    }, .{ .whitespace = .indent_2 }, out.writer());

    std.debug.print("{s}\n", .{out.items});
    std.debug.print("{any}\n", .{has_leto});
}
