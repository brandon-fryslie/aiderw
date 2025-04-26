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

## Testing

This repository uses [Bats](https://github.com/bats-core/bats-core) for automated testing of the `aiderw` script. Bats is a Bash testing framework that provides a simple way to verify the behavior of shell scripts.

### Running Tests

To run the tests, ensure you have Bats installed. You can install it via a package manager or from its GitHub repository.

#### Installing Bats

- **macOS**: You can install Bats using Homebrew with the following command:
  ```bash
  brew install bats-core
  ```

- **Linux**: You can install Bats using a package manager like `apt` for Debian-based systems:
  ```bash
  sudo apt-get update
  sudo apt-get install bats
  ```

  For other distributions, you may need to install Bats from its [GitHub repository](https://github.com/bats-core/bats-core).

Once installed, execute the tests with the following command:

```bash
bats tests/test_aiderw.bats
```

### Test Coverage

The test suite covers the following functionalities:
- Initialization of a Git repository if not present.
- Moving of aider files to the `.aider` directory.
- Updating of configuration paths.
- Downloading of fresh aider config if missing.
- Ensuring the script runs from the Git root.
- Checking for project root indicators.
- Prompting for Git initialization if not a project root.
- Prompting for config update if paths are not set.

Contributions are welcome! Please feel free to submit a pull request or open an issue if you have any suggestions or improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Example `.aider.conf.yml`

If you need to provide an example or template for `.aider.conf.yml`, you can include it in the `README.md` or as a separate file in the repository. Here's a basic example:

```yaml
# Example .aider.conf.yml
##########################################################
# Testing Setup
# The aiderw script is tested using Bats (Bash Automated Testing System).
# Ensure Bats is installed to run the test suite located in tests/test_aiderw.bats.
# Run the tests with the command: bats tests/test_aiderw.bats
##########################################################

model-settings-file: .aider/aider.model.settings
model-metadata-file: .aider/aider.model.metadata
input-history-file: .aider/aider.input.history
chat-history-file: .aider/aider.chat.history.md
llm-history-file: .aider/aider.llm.history
analytics-log: .aider/aider.analytics.log

# Command to run tests
test-cmd: bats tests/test_aiderw.bats
```

Make sure to adjust the paths and settings according to your specific needs and ensure they align with the changes made in the `aiderw` script.

- [Aider Project](https://github.com/paul-gauthier/aider): Aider is a tool designed to assist developers by providing AI-driven code suggestions and improvements, helping streamline the coding process and enhance productivity.
