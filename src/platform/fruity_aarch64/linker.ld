ENTRY(_start)
OUTPUT_FORMAT(elf64-littleaarch64)
OUTPUT_ARCH(aarch64)

PHDRS {
    none   PT_NULL FLAGS(0);
}


SECTIONS {
    . = 0x810000000;
    .blob : {
        *(.text.entry)
        *(.text.smp_stub)
        KEEP(*(.text.smp_entry))
        *(.text*)

        *(.data*)
        *(.rodata*)
        *(.bss*)
        . = ALIGN(16);
    }

    . = ALIGN(4K);

    .eh_frame : {
        *(.eh_frame*)
    }
}
