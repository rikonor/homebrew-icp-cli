class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "v0.1.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.10/icp-aarch64-apple-darwin-homebrew"
      sha256 "7c746d947ed75543c5b326daf866f27d78f105ca1a5e9fbe22e6113dcadbecef"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.10/icp-x86_64-apple-darwin-homebrew"
      sha256 "160cc7b465d6dde3c2d889f039f5896c3b1895ca91199c0d230a8cfdddfb7d09"
    end
  end

  def install
    downloaded_name = File.basename(stable.url)
    bin.install downloaded_name => "icp"
  end

  def post_install
    begin
    rescue StandardError => e
      puts "Other error: #{e.message}"
    end
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
