const std = @import("std");
const builtin = @import("builtin");

const Allocator = std.mem.Allocator;
const io = std.io;

const User = struct {
    name: []const u8,
    power: i32,

    /// Creates a new User, allocating memory for the name.
    pub fn init(allocator: Allocator, name: []const u8, power: i32) !User {
        const owned_name = try allocator.dupe(u8, name);
        return User{
            .name = owned_name,
            .power = power,
        };
    }

    /// Frees the memory allocated for the User's name.
    pub fn deinit(self: @This(), allocator: Allocator) void {
        allocator.free(self.name);
    }
};

fn sum(a: i32, b: i32) i32 {
    return a + b;
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

    var line_buffer = std.ArrayList(u8).init(allocator);
    defer line_buffer.deinit();

    var index: i32 = 0;

    while (true) : (index += 1) {
        try stdout.print("Please enter a name (or press Enter to finish): ", .{});

        // Read a full line from stdin, using the ArrayList as a dynamic buffer.
        // This correctly handles names of any length.
        if (try stdin.readUntilDelimiterOrEof(line_buffer.writer(), '\n')) |line| {
            // Trim whitespace, including the trailing newline characters.
            const name = std.mem.trim(u8, line, " \t\r\n");

            if (name.len == 0) {
                break;
            }

            // Use the new init function to create a user.
            // This encapsulates the memory allocation for the name.
            const user = try User.init(allocator, name, index);
            try arr.append(user);

            // Clear the buffer for the next iteration.
            line_buffer.clearRetainingCapacity();
        } else {
            // End of file reached.
            break;
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

    sum(1, 2);
}
