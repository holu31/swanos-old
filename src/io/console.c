#include <console.h>

void cinit(void) {
    row = 0;
    column = 0;
    color = VGA_COLOR_LIGHT_GREY | VGA_COLOR_BLACK << 4;
    buffer = (uint16_t*) 0xC03FF000;
    for (size_t y = 0; y < 25; y++){
        for (size_t x = 0; x < 80; x++){
            const size_t index = y * 80 + x;
            buffer[index] = (uint16_t) ' ' | (uint16_t) color << 8;
        }
    }
}

void cputch(char c){
    const size_t index = row * 80 + column;
    if(c != '\n') buffer[index] = (uint16_t) c | (uint16_t) color << 8;
    if (++column == 80 || c == '\n') {
        column = 0;
        if (++row == 25)
            row = 0;
    }
}