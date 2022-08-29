// todo-cli v0.1.0

// Build:                          'clang++ -o todo-cli Main.cpp'
// Run:                            './todo-cli'
// Clear terminal, build and run:  'clear && clang++ -o todo-cli Main.cpp && ./todo-cli'

#include <iostream>
#include <string>

/// Prints version.
void printVersion() {
  std::cout << "todo-cli version 0.1.0\n\n";
}

/// Prints help.
void printHelp() {
  // Print description.
  std::cout << "Create and manage tasks list from the command line.\n\n";

  // Print usage.
  std::cout << "Usage:\n"
            << "  /path/to/app/todo-cli <command>\n\n";

  // Print commands.
  std::cout << "Commands:\n"
            << "  version  Print version.\n"
            << "  help     Print help.\n"
            << "  test     Print argc and argv.\n\n";

  // Print examples:
  std::cout << "Examples:\n"
            << "  $ ./todo-cli\n"
            << "  $ ./todo-cli version\n"
            << "  $ ./todo-cli help\n\n";
}

/// Prints arguments.
void test(int argc, char *argv[]) {
  std::cout << "argc:  " << argc << '\n'
            << "argv:\n";

  for (int argIndex = 0; argIndex < argc; ++argIndex) {
    std::cout << "  " << argv[argIndex] << '\n';
  }
  std::cout << '\n';
}


int main(int argc, char *argv[]) {
  if (argc == 1) {
    printVersion();
    printHelp();
  }

  int unknownArgumetsCount = 0;

  for (int argIndex = 1; argIndex < argc; ++argIndex) {
    const auto &argument = std::string(argv[argIndex]);

    if (argument == "version") {
      printVersion();
    } else if (argument == "help") {
      printHelp();
    } else if (argument == "test") {
      test(argc, argv);
    } else {
      ++unknownArgumetsCount;
      std::cerr << "Error: Ohh shit. You used an unknown argument `" << argument << "`.\n\n";
    }
  }
  return 0;
}
