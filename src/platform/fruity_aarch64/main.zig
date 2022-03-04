pub const sabaton = @import("../../sabaton.zig");
pub const io = @import("io.zig");
pub const panic = sabaton.panic;

const std = @import("std");

pub const display = @import("display.zig");

var page_size: u64 = 0x1000; // TODO: some fruits have 16k and some have 4k, should probably add this to fruitboot

pub fn get_page_size() u64 {
    return page_size;
}

const mmap_ent = extern struct {
    addr: u64,
    size: u64,
};
const fbinfo = extern struct {
    addr: u64,
    pitch: u64,
    width: u64,
    height: u64,
};
const fruitboot = extern struct {
    cmdline: [*]u8,
    mmap_len: u64,
    mmap: [*]mmap_ent,
    fb: fbinfo,
    kernptr: u64,
    kernsz: u64,
    dtb: [*]u64,
};

const putchar_t = fn(u8) callconv(.C) void;
const fruitboot_blob_t = fn(putchar_t, *fruitboot) callconv(.C) noreturn;

export fn _start(putchar: putchar_t, _: *fruitboot) linksection(".text.entry") noreturn {
    page_size = sabaton.paging.detect_page_size();
    io.do_putchr = putchar;
    @panic("byeee!");
    // @call(.{ .modifier = .always_inline }, sabaton.main, .{});
}

pub fn get_kernel() [*]u8 {
    @panic("TODO: get_kernel");
}

pub fn get_dtb() []u8 {
    @panic("TODO: get_dtb");
}

pub fn get_dram() []u8 {
    @panic("TODO: get_dram");
}

pub fn map_platform(_: *sabaton.paging.Root) void {
    @panic("TODO: map_platform");
    // sabaton.paging.map(0, 0, 1024 * 1024 * 1024, .rw, .mmio, root);
    // sabaton.paging.map(sabaton.upper_half_phys_base, 0, 1024 * 1024 * 1024, .rw, .mmio, root);
}

pub fn add_platform_tags(kernel_header: *sabaton.Stivale2hdr) void {
    _ = kernel_header;
    @panic("TODO: add_platform_tags");
    // sabaton.add_tag(&sabaton.near("devicetree_tag").addr(sabaton.Stivale2tag)[0]);
}
