const putchar_t = fn(u8) callconv(.C) void;
pub var do_putchr: putchar_t = putchar_mock;
fn putchar_mock(_: u8) callconv(.C) void {

}

pub fn putchar(_: u8) void {
    // write_reg(char, addr);
}