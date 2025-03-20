# Homebrew ICP CLI

Homebrew tap for [icp-cli](https://github.com/rikonor/icp-cli), a command-line utility for Internet Computer that uses WebAssembly component model for extension support.

## Installation

```bash
brew tap rikonor/icp-cli
brew install icp-cli
```

## Features

- Pre-installed extensions (multiply, power)

- WebAssembly component-based extension system
- Extension system with clear interfaces
- Async operation support

## Development

### Testing Installation

To test the installation repeatedly, you can use this sequence to clean up and reinstall:

```bash
# Clean up previous installation
brew uninstall icp-cli
brew untap rikonor/icp-cli

# Install fresh
brew tap rikonor/icp-cli
brew install icp-cli
```

### Updating the Formula

To update the formula when a new version is released:

```bash
brew bump-formula-pr --version=NEW_VERSION \
  --no-fork \
  homebrew-icp-cli/Formula/icp-cli.rb
```

For manual updates:

1. Update the version number in the formula
2. Update both URLs for ARM and Intel builds
3. Get new SHA256 hashes using `shasum -a 256` on the downloaded files
4. Test the formula with `brew install --build-from-source ./Formula/icp-cli.rb`
5. Commit and push changes

## License

MIT
