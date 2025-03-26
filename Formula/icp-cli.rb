class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v1.0.0/icp-aarch64-apple-darwin-homebrew"
      sha256 "f669610852a2a60a7db2a2cfc9b615bd375a40715e7068c18a129fc4072af6c4"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v1.0.0/icp-x86_64-apple-darwin-homebrew"
      sha256 "46c0a10efd1cc3294f33b32fdc1df43eb9aca31a68ea650dd488fea37b6a9b89"
    end
  end

  def install
    downloaded_name = File.basename(stable.url)
    bin.install downloaded_name => "icp"
  end

  def post_install
    begin
      system "#{bin}/icp", "extension", "add", "--name", "multiply", "--force", "--checksum", "441c5cdd188105d1839b0e7e059a2d0586d9496e7943496ffc9e2eb69166bdc2", "https://github.com/rikonor/icp-cli/releases/download/v1.0.0/multiply.component.wasm"
      system "#{bin}/icp", "extension", "add", "--name", "square", "--force", "--checksum", "43c9c6045d2eca29eb9d2d30456dc34cf8530ecc0f2eeb425c2e4e4ddab07b6b", "https://github.com/rikonor/icp-cli/releases/download/v1.0.0/square.component.wasm"
    rescue StandardError => e
      puts "Other error: #{e.message}"
    end
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
