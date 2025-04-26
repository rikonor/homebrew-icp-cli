class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "v0.1.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.12/icp-aarch64-apple-darwin-homebrew"
      sha256 "f19b21caabe2b28208d71335ad274d0e600685b073336a37485b757a666d2b8a"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.12/icp-x86_64-apple-darwin-homebrew"
      sha256 "d8ba711a9e108440be4b31f7502a199d251204fcea5821a97af4c7c5ce5ad545"
    end
  end

  def install
    downloaded_name = File.basename(stable.url)
    bin.install downloaded_name => "icp"
  end

  def post_install
    begin
      system "#{bin}/icp", "extension", "add", "--name", "project", "--force", "--checksum", "8bc7d8ce09fcc0f5ca62c1e39e762473754fd3ebf4b6b2fefe34092649496a0b", "https://github.com/rikonor/icp-cli/releases/download/v0.1.12/project.component.wasm"
    rescue StandardError => e
      puts "Other error: #{e.message}"
    end
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
