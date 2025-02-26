/* Generic STM32F4, no bootloader */
MEMORY {
       rom (rx) : ORIGIN = 0x08000000, LENGTH = 512K
       ram (rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

INCLUDE libucmx_stm32f4.ld
