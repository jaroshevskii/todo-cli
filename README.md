# Todo CLI

Create and manage tasks list from the command line.

```
[jaroshevskii@archlinux todo-cli]$ ./todo-cli
todo-cli version 0.1.0

Create and manage tasks list from the command line.

Usage:
  /path/to/app/todo-cli <command>

Commands:
  version  Print version.
  help     Print help.
  test     Print argc and argv.

Examples:
  $ ./todo-cli
  $ ./todo-cli version
  $ ./todo-cli help

```

## Build

`clang++ -o todo-cli Main.cpp`

## Run

`./todo-cli`

## Clear terminal, build and run

`clear && clang++ -o todo-cli Main.cpp && ./todo-cli`
