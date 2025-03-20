class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.5/icp-cli-aarch64-apple-darwin"
      sha256 "bf1a24ef33ff708a29242ff1a86899749a8fe4ca3abddc62984e041a98be223f"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.5/icp-cli-x86_64-apple-darwin"
      sha256 "e92f69a6ba1371865199a9441dc4b93c1a9ad0a23faa7b0223184739db33f788"
    end
  end

  def install
    downloaded_name = File.basename(stable.url)
    bin.install downloaded_name => "icp"
  end

  def post_install
    # Download and install the multiply extension
    multiply_url = "https://github.com/rikonor/icp-cli/releases/download/v0.1.5/multiply.component.wasm"
    system bin/"icp", "extension", "add", "--name", "multiply", multiply_url

    # Download and install the power extension
    power_url = "https://github.com/rikonor/icp-cli/releases/download/v0.1.5/power.component.wasm"
    system bin/"icp", "extension", "add", "--name", "power", power_url
  end
end
