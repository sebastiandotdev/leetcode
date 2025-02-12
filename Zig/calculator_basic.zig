const std = @import("std");

pub const Calculator = struct {
    num_one: i32,
    num_two: i32,

    pub fn sum(self: Calculator) i32 {
        return self.num_one + self.num_two;
    }

    pub fn substract(self: Calculator) i32 {
        return self.num_one - self.num_two;
    }

    pub fn multiply(self: Calculator) i32 {
        return self.num_one * self.num_two;
    }

    pub fn split(self: Calculator) i32 {
        return @divFloor(self.num_one, self.num_two);
    }
};

pub fn main() void {
    const calculator_sum = Calculator{ .num_one = 10, .num_two = 20 };

    const result_sum = calculator_sum.sum();
    const result_rest = calculator_sum.substract();
    const result_ml = calculator_sum.multiply();
    const result_split = calculator_sum.split();

    std.debug.print("The result is: {d} - {d} - {d} - {d}\n", .{ result_sum, result_rest, result_ml, result_split });
}
