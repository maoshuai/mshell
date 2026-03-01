# MShell

> **MShell** stands for **Modularized Shell**. It helps you write large yet well-maintainable shell scripts.

![MShell Architecture](https://raw.githubusercontent.com/maoshuai/mshell/main/doc/img/header.png)

MShell is a framework designed to bring modularity, structure, and enterprise-grade features to shell scripting. It transforms traditional linear shell scripts into organized, maintainable applications with proper error handling, logging, and module systems.

## 🏗️ Architecture Overview

MShell follows a clean architecture with distinct layers:

- **Launcher**: Entry point that initializes the environment
- **Module System**: Reusable components with `importModule` syntax  
- **Job Scheduler**: Manages execution lifecycle with logging and monitoring
- **Handlers**: Business logic containers following the handler pattern
- **Configuration**: Profile-based environment management

## 🚀 Quick Start

### Installation

**MacOS & Linux:**
```bash
git clone https://github.com/maoshuai/mshell.git
echo 'MSHELL_PROFILE=dev' > ~/.mshellrc
```

### Basic Usage

```bash
# Run a simple handler
./shell/launcher.sh sample/4_use_module.sh "hello world"

# Run any shell script (backward compatible)
./shell/launcher.sh sample/1_native_shell.sh
```

## 📚 Core Concepts

### Module System
Import reusable modules anywhere in your scripts:
```bash
importModule 'log'
importModule 'util'

handler_main(){
    logInfo "Processing arguments: $@"
    util_assertArgumentNotEmpty "$1" "first argument"
}
```

### Handler Pattern
All business logic should be implemented as handlers in `shell/handler/`:
- Define a `handler_main()` function as the entry point
- Import modules as needed
- Return appropriate exit codes for job status

### Job Lifecycle
Each handler execution is treated as a job with full lifecycle management:
1. **Initialization**: Set up logging, generate job ID, acquire locks
2. **Execution**: Run your `handler_main()` function  
3. **Monitoring**: Track execution time, parameters, and system info
4. **Cleanup**: Release resources and output execution summary

## 🔧 Built-in Modules

MShell comes with several built-in modules:

- **`log`**: Structured logging with multiple levels (info, warn, error, echo)
- **`util`**: Utility functions (`util_assertArgumentNotEmpty`, `util_isFileEmpty`)
- **`job`**: Job scheduling and lifecycle management
- **`profile`**: Configuration profile management
- **`lock`**: File-based locking for concurrent execution safety
- **`git`**: Git repository information integration
- **`cache`**: Simple caching mechanisms

## 🎯 Use Cases

- **Complex Automation Scripts**: When your shell scripts grow beyond simple sequences
- **DevOps Tooling**: Reliable, logged, and monitored operational scripts  
- **CI/CD Pipelines**: Structured build and deployment scripts
- **System Administration**: Maintainable and debuggable admin scripts

## 🛠️ Development

### Building
```bash
mvn clean package
```

### Creating Custom Handlers
1. Create a new file in `shell/handler/`
2. Import required modules with `importModule`
3. Implement your `handler_main()` function
4. Execute via `./shell/launcher.sh your_handler_name`

### Extending Modules
1. Create `.module` files in `shell/module/`
2. Define functions and variables
3. Import in handlers using `importModule 'your_module_name'`

## 📜 License

Distributed under the Apache License 2.0. See [LICENSE](LICENSE) for more information.

## 👥 Contributing

1. Fork it (<https://github.com/maoshuai/mshell/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

## 📞 Meta

**Maoshuai** – [GitHub](https://github.com/maoshuai) – imshuai67@gmail.com

**Documentation by maobot2026 (AI Assistant)** – [GitHub](https://github.com/maobot2026)

---

*Write better shell scripts with MShell's modular approach!*