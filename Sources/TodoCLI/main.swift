// void printVersion() {
//   std::cout << "todo-cli version 0.1.0\n\n";
// }
func printVersion() {
    print("todo-cli version 0.1.0\n")
}

// void printHelp() {
//   // Print description.
//   std::cout << "Create and manage tasks list from the command line.\n\n";
//
//   // Print usage.
//   std::cout << "Usage:\n"
//             << "  /path/to/app/todo-cli <command>\n\n";
//
//   // Print commands.
//   std::cout << "Commands:\n"
//             << "  version  Print version.\n"
//             << "  help     Print help.\n"
//             << "  test     Print argc and argv.\n\n";
//
//   // Print examples:
//   std::cout << "Examples:\n"
//             << "  $ ./todo-cli\n"
//             << "  $ ./todo-cli version\n"
//             << "  $ ./todo-cli help\n\n";
// }
func printHelp() {
    print("""
    Create and manage tasks list from the command line.

    Usage:
      /path/to/app/dir/todo-cli <command>

    Commands:
      version  Print version.
      help     Print help.
      test     Print argc and argv.
    
    Examples:
      $ ./todo-cli
      $ ./todo-cli version
      $ ./todo-cli help

    """)
}

// void test(int argc, char *argv[]) {
//   std::cout << "argc:  " << argc << '\n'
//             << "argv:\n";

//   for (int argIndex = 0; argIndex < argc; ++argIndex) {
//     std::cout << "  " << argv[argIndex] << '\n';
//   }
//   std::cout << '\n';
// }
func test(_ arguments: [String]) {
    print("""
    Arguments count: \(arguments.count)
    Arguments:
    """)

    for argument in arguments {
        print("  \(argument)")
    }

    print()  // Prints empty line.
}

// int main(int argc, char *argv[]) {
//   if (argc == 1) {
//     printVersion();
//     printHelp();
//   }
// 
//   int unknownArgumetsCount = 0;
// 
//   for (int argIndex = 1; argIndex < argc; ++argIndex) {
//     const auto &argument = std::string(argv[argIndex]);
// 
//     if (argument == "version") {
//       printVersion();
//     } else if (argument == "help") {
//       printHelp();
//     } else if (argument == "test") {
//       test(argc, argv);
//     } else {
//       ++unknownArgumetsCount;
//       std::cerr << "Error: Ohh shit. You used an unknown argument `" << argument << "`.\n\n";
//     }
//   }
//   return 0;
// }
var arguments = CommandLine.arguments

if arguments.count == 1 {
    printVersion()
    printHelp()
} else {
    arguments.removeFirst()  // Removes app path.

    var unknownArgumetsCount = 0

    for argument in arguments {
        switch argument {
        case "version":
            printVersion()
        case "help":
            printHelp()
        case "test":
            test(arguments)
        default:
            print("Error: Ohh shit. You used an unknown argument '\(argument)'.\n")
            unknownArgumetsCount += 1
        }
    }
}