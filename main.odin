package main

import "core:os"
import "core:strings"
import "core:fmt"

main :: proc() {
    open_file()
}

open_file :: proc() {
    data, ok := os.read_entire_file("./json.json", context.allocator)

    if !ok {
        return 
    }

    defer delete(data, context.allocator)

    it := string(data)
    for line in strings.split_lines_iterator(&it) {
        fmt.println(line)
    }
}