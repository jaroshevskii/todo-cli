enum Color: String {
    static let reset = "\u{001B}[0m"
    static let black = "\u{001B}[0;30m"
    static let red = "\u{001B}[0;31m"
    static let green = "\u{001B}[0;32m"
    static let yellow = "\u{001B}[0;33m"
    static let blue = "\u{001B}[0;34m"
    static let purple = "\u{001B}[0;35m"
    static let cyan = "\u{001B}[0;36m"
    static let white = "\u{001B}[0;37m"
}

func printLogo() {
    let logoColorMain = Color.green
    let logoColorSecondary = Color.purple
    print("""
        \(logoColorMain) ______        __     \(logoColorSecondary)_______   ____
        \(logoColorMain)/_  __/__  ___/ /__  \(logoColorSecondary)/ ___/ /  /  _/
        \(logoColorMain) / / / _ \\/ _  / _ \\\(logoColorSecondary)/ /__/ /___/ /
        \(logoColorMain)/_/  \\___/\\_,_/\\___/\(logoColorSecondary)\\___/____/___/
    \(Color.reset.rawValue)
    """)
}

func printVersion() {
    print("""
    TodoCLI v0.1.0
    Create and manage tasks list from the command line.

    """)
}

func printHelp() {
    print("""
    \(Color.yellow)Usage:\(Color.reset)
      /path/to/app/dir/TodoCLI <command>

    \(Color.yellow)Commands:\(Color.reset)
      version  Prints version.
      help     Prints help.
      test     Prints arguments.
    
    \(Color.yellow)Examples:\(Color.reset)
      $ TodoCLI
      $ TodoCLI version
      $ TodoCLI help

    """)
}

func test(arguments: [String]) {
    print("""
    Arguments count: \(arguments.count)
    Arguments:       \(arguments)
    
    """)
}

// MARK: Main

var arguments = CommandLine.arguments

if arguments.count == 1 {
    printLogo()
    printVersion()
    printHelp()
} else {
    // Removes app path.
    arguments.removeFirst()

    switch arguments.first {
    case "version":
        printVersion()
    case "help":
        printHelp()
    case "test":
        test(arguments: arguments)
    default:
        print("""
        \(Color.red)Error:\(Color.reset) Ohh shit. You used an unknown argument(s): \(arguments).
        \(Color.blue)Note:\(Color.reset)  Use `$ TodoCLI help` to see the list of available commands.

        """)
    }
}