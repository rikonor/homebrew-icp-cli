class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v1.0.1/icp-aarch64-apple-darwin-homebrew"
      sha256 "cfec309c6477bc9cebb1c039eebad627d84043466119f0f67c686414c50e1b56"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v1.0.1/icp-x86_64-apple-darwin-homebrew"
      sha256 "9ace358475a4a50256edd657278830dfbd380faa652ea08c89e39b5c4b2db027"
    end
  end

  def install
    downloaded_name = File.basename(stable.url)
    bin.install downloaded_name => "icp"
  end

  def post_install
    begin
      system "#{bin}/icp", "extension", "add", "--name", "multiply", "https://github.com/rikonor/icp-cli/releases/download/v1.0.1/multiply.component.wasm"
      system "#{bin}/icp", "extension", "add", "--name", "power", "https://github.com/rikonor/icp-cli/releases/download/v1.0.1/power.component.wasm"
    rescue StandardError => e
      puts "Other error: #{e.message}"
    end
  end
end
