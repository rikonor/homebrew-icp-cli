class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v1.0.1/icp-aarch64-apple-darwin-homebrew"
      sha256 "201fe0e8d660ef38b77b991af432cd6618ebefe63bd5abd8bb52b17b750f277a"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v1.0.1/icp-x86_64-apple-darwin-homebrew"
      sha256 "15e5a3b0321b2797f1b599fb1eda389f596310a1ffc0ee83d3c80650d582fe4c"
    end
  end

  def install
    downloaded_name = File.basename(stable.url)
    bin.install downloaded_name => "icp"
  end

  def post_install
    begin
      system "#{bin}/icp", "extension", "add", "--name", "multiply", "--force", "--checksum", "55714ed4bf9d1fffa58d52449127b0c2521d0e86ecc85ef4e1b3c8447b689d91", "https://github.com/rikonor/icp-cli/releases/download/v1.0.1/multiply.component.wasm"
      # system "#{bin}/icp", "extension", "add", "--name", "square", "--force", "--checksum", "caae49ec44fdf13a81489f110422a4d8312e9e22ade253d4dc9ba6699392c028", "https://github.com/rikonor/icp-cli/releases/download/v1.0.1/square.component.wasm"
    rescue StandardError => e
      puts "Other error: #{e.message}"
    end
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
