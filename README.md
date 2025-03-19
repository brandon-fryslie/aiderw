# Aiderw Script


## Overview

This repository contains the `aiderw` script, a small wrapper around the `aider` tool. The script is designed to enhance the user experience by providing additional setup and configuration management for `aider`, ensuring it runs smoothly within a Git repository environment.

[Aider Project](https://github.com/paul-gauthier/aider)

## Features

- **Automatic Git Initialization**: If the script is run outside of a Git repository, it prompts the user to initialize one, as `aider` works best within a Git-managed project.
- **Configuration Management**: The script checks for the presence of both global and project-level `aider` configuration files, downloading fresh copies if they are missing.
- **Project Root Detection**: It attempts to determine if the current directory is a project root based on common project files, and initializes a Git repository if necessary.
- **User-Friendly Prompts**: Provides clear prompts and logging to guide the user through the setup process.

## Installation

To install the `aiderw` script, run the `install.sh` script. This will create a symlink in your `$HOME/.local/bin` directory, or in the directory specified by the `XDG_BIN_HOME` environment variable if it is set.

```bash
./install.sh
```

## Usage

Once installed, you can set up an alias to easily run the `aiderw` script using the command `aider`. Add the following line to your shell's configuration file (e.g., `~/.bashrc` or `~/.zshrc`):

```bash
alias aider='aiderw'
```

After adding the alias, reload your shell configuration or restart your terminal to apply the changes.

## How It Works

1. **Wrapper Logic**: The script can be bypassed with the `--bare` option, allowing direct execution of `aider`.  You can also run it like this: `\aider ...` to execute the original binary.  This is only necessary if you aliased 'aiderw' to 'aider'.
2. **Setup Checks**: It ensures that aider's configuration file is in place and that the script is running in a suitable environment.
3. **Execution**: After setup, the script runs `aiderw` (or `aider`, with alias configured) with any provided arguments.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue if you have any suggestions or improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Related Projects

- [Aider Project](https://github.com/paul-gauthier/aider): Aider is a tool designed to assist developers by providing AI-driven code suggestions and improvements, helping streamline the coding process and enhance productivity.
