const std = @import("std");
const debug = @import("std").debug;
const mem = @import("std").mem;

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

    // ------------------------------------- More types -------------------------------------- //
    // i8	int8_t	signed 8-bit integer
    // u8	uint8_t	unsigned 8-bit integer
    // i16	int16_t	signed 16-bit integer
    // u16	uint16_t	unsigned 16-bit integer
    // i32	int32_t	signed 32-bit integer
    // u32	uint32_t	unsigned 32-bit integer
    // i64	int64_t	signed 64-bit integer
    // u64	uint64_t	unsigned 64-bit integer
    // i128	__int128	signed 128-bit integer
    // u128	unsigned __int128	unsigned 128-bit integer
    // isize	intptr_t	signed pointer sized integer
    // usize	uintptr_t, size_t	unsigned pointer sized integer. Also see #5185
    // c_char	char	for ABI compatibility with C
    // c_short	short	for ABI compatibility with C
    // c_ushort	unsigned short	for ABI compatibility with C
    // c_int	int	for ABI compatibility with C
    // c_uint	unsigned int	for ABI compatibility with C
    // c_long	long	for ABI compatibility with C
    // c_ulong	unsigned long	for ABI compatibility with C
    // c_longlong	long long	for ABI compatibility with C
    // c_ulonglong	unsigned long long	for ABI compatibility with C
    // c_longdouble	long double	for ABI compatibility with C
    // f16	_Float16	16-bit floating point (10-bit mantissa) IEEE-754-2008 binary16
    // f32	float	32-bit floating point (23-bit mantissa) IEEE-754-2008 binary32
    // f64	double	64-bit floating point (52-bit mantissa) IEEE-754-2008 binary64
    // f80	double	80-bit floating point (64-bit mantissa) IEEE-754-2008 80-bit extended precision
    // f128	_Float128	128-bit floating point (112-bit mantissa) IEEE-754-2008 binary128
    // bool	bool	true or false
    // anyopaque	void	Used for type-erased pointers.
    // void	(none)	Always the value void{}
    // noreturn	(none)	the type of break, continue, return, unreachable, and while (true) {}
    // type	(none)	the type of types
    // anyerror	(none)	an error code
    // comptime_int	(none)	Only allowed for comptime-known values. The type of integer literals.
    // comptime_float	(none)	Only allowed for comptime-known values. The type of float literals.
    // undefined used to leave a value unspecified

    const bytes = "Hola, Mundo";

    debug.print("{}\n", .{@TypeOf(bytes)}); // imprime tipo de dat
    debug.print("{d}\n", .{bytes.len}); // logintud
    debug.print("{c}\n", .{bytes[1]}); // para imprimir el caracter
    debug.print("{c}\n", .{bytes[5]}); // para imprimir decimales
    debug.print("{}\n", .{mem.eql(u8, "hello", "h\x65llo")});
}
