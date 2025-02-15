const std = @import("std");

const Vowels = struct {
    a: usize = 0,
    e: usize = 0,
    i: usize = 0,
    o: usize = 0,
    u: usize = 0,
};

fn countingVowels(text: []const u8) Vowels {
    var vowels = Vowels{};

    for (text) |value| {
        switch (std.ascii.toLower(value)) {
            'a' => vowels.a += 1,
            'e' => vowels.e += 1,
            'i' => vowels.i += 1,
            'o' => vowels.o += 1,
            'u' => vowels.u += 1,
            else => {},
        }
    }

    return vowels;
}

pub fn main() void {
    const hello_world = countingVowels("Hola, Mundo");
    const bear = countingVowels("Oso");

    std.debug.print("La palabra tiene un total de: {any} caracteres.\n", .{hello_world});
    std.debug.print("La palabra tiene un total de: {any} caracteres.\n", .{bear});
}
