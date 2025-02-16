const std = @import("std");

pub fn isPalindrome(str: []const u8) !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var reversed = std.ArrayList(u8).init(allocator);
    defer reversed.deinit();

    var is_palindrome_string = true;
    var index: usize = str.len;

    while (index > 0) {
        index -= 1;

        const string = str[index];
        try reversed.append(string);
    }

    for (str, 0..) |char, i| {
        if (char != reversed.items[i]) {
            is_palindrome_string = false;
            break;
        }
    }

    if (is_palindrome_string) {
        std.debug.print("La palabra '{s}' es un palindrome\n", .{str});
    } else {
        std.debug.print("La palabra '{s}' no es un palindrome\n", .{str});
    }
}

pub fn main() !void {
    try isPalindrome("Hola");
    try isPalindrome("Oso");
    try isPalindrome("Hola");
}
