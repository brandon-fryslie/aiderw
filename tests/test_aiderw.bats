#!/usr/bin/env bats

setup() {
  # Create a temporary directory for each test
  test_dir=$(mktemp -d)
  cd "$test_dir"

  # Create a temporary home directory
  temp_home=$(mktemp -d)
  export HOME="$temp_home"

  # Copy the aiderw script from one directory up
  cp "$(dirname "$BATS_TEST_FILENAME")/../aiderw" "$test_dir/aiderw"
  chmod +x "$test_dir/aiderw"
  # Mock the download function by overriding it
  download_fresh_aider_config() {
    local output_file="$1"
    echo "# Mock config file" > "$output_file"
    echo "Mock: Fetched fresh aider config."
  }
}

teardown() {
  # Clean up after each test
  rm -rf "$test_dir"
  rm -rf "$temp_home"
}

@test "Initialize a Git repository if not in one" {
  export AIDERW_NON_INTERACTIVE_RESPONSE=YES
  export AIDERW_NON_INTERACTIVE_RESPONSE=YES
  export AIDERW_NON_INTERACTIVE_RESPONSE=YES
  run timeout 5 bash "$test_dir/aiderw"
  echo "$output"
  [ "$status" -eq 0 ]
  [ -d ".git" ]
}

@test "Move aider files to .aider directory" {
  export AIDERW_NON_INTERACTIVE_RESPONSE=YES
  touch .aider.input.history
  run timeout 5 bash "$test_dir/aiderw"
  echo "$output"
  [ "$status" -eq 0 ]
  [ -f ".aider/aider.input.history" ]
}

@test "Update configuration paths" {
  export AIDERW_NON_INTERACTIVE_RESPONSE=YES
  export AIDERW_NON_INTERACTIVE_RESPONSE=YES
  echo "input-history-file: .aider.input.history" > .aider.conf.yml
  run timeout 5 bash "$test_dir/aiderw"
  echo "$output"
  [ "$status" -eq 0 ]
  grep -q "input-history-file: .aider/aider.input.history" .aider.conf.yml
}

@test "Download fresh aider config if missing" {
  run timeout 5 bash "$test_dir/aiderw"
  echo "$output"
  [ "$status" -eq 0 ]
  [ -f "$HOME/.aider.conf.yml" ]
  grep -q "# Mock config file" "$HOME/.aider.conf.yml"
}

@test "Ensure script runs from Git root" {
  export AIDERW_NON_INTERACTIVE_RESPONSE=YES
  git init
  mkdir subdir
  cd subdir
  run timeout 5 bash "$test_dir/aiderw"
  echo "$output"
  [ "$status" -eq 0 ]
  [ "$(pwd)" = "$(git rev-parse --show-toplevel)" ]
}

@test "Check project root indicators" {
  export AIDERW_NON_INTERACTIVE_RESPONSE=YES
  touch setup.py
  run timeout 5 bash "$test_dir/aiderw"
  echo "$output"
  [ "$status" -eq 0 ]
  [ -d ".git" ]
}

@test "Prompt for Git init if not a project root" {
  run timeout 5 bash "$test_dir/aiderw"
  echo "$output"
  [ "$status" -eq 0 ]
  [ -d ".git" ]
}

@test "Prompt for config update if paths not set" {
  echo "input-history-file: .aider.input.history" > .aider.conf.yml
  export AIDERW_NON_INTERACTIVE_RESPONSE=YES
  run bash "$test_dir/aiderw"
  [ "$status" -eq 0 ]
  grep -q "input-history-file: .aider/aider.input.history" .aider.conf.yml
}
