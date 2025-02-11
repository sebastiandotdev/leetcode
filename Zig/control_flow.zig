const std = @import("std");

const mem = std.mem;
const debug = std.debug;

pub const ControlFlow = struct {
    pub const POWER = 9001;
    pub const METHOD_DEFAULT = "POST";

    pub fn compare_with_if(method: []const u8) bool {
        var result = false;

        if (mem.eql(u8, METHOD_DEFAULT, method)) {
            result = true;
        }
        return result;
    }

    pub fn compare_with_switch(years_married: u16) []const u8 {
        switch (years_married) {
            1 => return "paper",
            2 => return "cotton",
            3 => return "leather",
            4 => return "flower",
            5 => return "wood",
            6 => return "sugar",
            else => return "no more gifts for you",
        }
    }

    pub fn contains(haystack: []const u32, needle: u8) bool {
        for (haystack) |value| {
            if (needle == value) {
                return true;
            }
        }
        return false;
    }
};

pub fn main() void {
    const is_compare = ControlFlow.compare_with_if("POST");
    const is_compare_with_switch = ControlFlow.compare_with_switch(3);

    const arr_not_static: [5]u32 = .{ 1, 2, 3, 4, 5 };
    const slice = arr_not_static[0..arr_not_static.len];
    const slice_copy = arr_not_static[0..arr_not_static.len];

    const is_contains_with_for = ControlFlow.contains(slice, 3);

    const super = if (ControlFlow.POWER > 9000) true else false;

    const arr_not_static_u8 = "Hello, world";
    const slice_u8 = arr_not_static_u8[0..2];

    for (0..10) |i| {
        debug.print("{d}\n", .{i});
    }
    slice_and_string_with_param(arr_not_static_u8);
    slice_and_string_with_param(slice_u8);

    // En Zig, outer es una etiqueta que se utiliza para identificar un bucle externo.
    // Esta etiqueta se puede utilizar junto con la palabra clave continue para saltar a la siguiente iteración del bucle externo desde un bucle interno.

    // outer: etiqueta el bucle externo que itera sobre i desde 1 hasta 10.
    // El bucle interno itera sobre j desde i hasta 10.
    // La condición if (i * j > (i + i + j + j)) verifica si el producto de i y j es mayor que la suma de i e i más j y j.
    // Si la condición es verdadera, continue :outer salta a la siguiente iteración del bucle externo, es decir, pasa al siguiente valor de i.
    // Si la condición es falsa, se imprime el mensaje en la consola.
    outer: for (1..10) |i| {
        for (i..10) |j| {
            if (i * j > (i + i + j + j)) continue :outer;
            std.debug.print("{d} + {d} >= {d} * {d}\n", .{ i + i, j + j, i, j });
        }
    }

    var i: i32 = 0;
    while (i < 10) {
        std.debug.print("{d}\n", .{i});
        i += 1;
    }

    debug.print("Compare slice: {any}\n", .{mem.eql(u32, slice, slice_copy)});
    debug.print("EL resultado es: {any}\n", .{is_contains_with_for});
    debug.print("Married: {s}\n", .{is_compare_with_switch});
    debug.print("El resultado de la comparación es: {any} - {any}\n", .{ is_compare, super });
}

pub fn slice_and_string_with_param(slice_or_string: []const u8) void {
    debug.print("Position 0: {any}", .{slice_or_string[0]});
}
