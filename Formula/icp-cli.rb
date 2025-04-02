class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v1.0.2/icp-aarch64-apple-darwin-homebrew"
      sha256 "7c146c6bc66ef32d636329c57131b0fccbdbae2c9fdc362315b121bba1751fd1"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v1.0.2/icp-x86_64-apple-darwin-homebrew"
      sha256 "0fd6bedf2257bf9fb8450dba8d522f7f02f65180474dea489644e23dbbf5d3cf"
    end
  end

  def install
    downloaded_name = File.basename(stable.url)
    bin.install downloaded_name => "icp"
  end

  def post_install
    begin
      system "#{bin}/icp", "extension", "add", "--name", "multiply", "--force", "--checksum", "f820eec816d8a0270aa34a602a0de9e89a08f99962e3f65ba985afb7e0024625", "https://github.com/rikonor/icp-cli/releases/download/v1.0.2/multiply.component.wasm"
      system "#{bin}/icp", "extension", "add", "--name", "square", "--force", "--checksum", "9afe2d772dd01bd46a736bfaecd16b9a800dff87eaa110dfcbeac8a11235d149", "https://github.com/rikonor/icp-cli/releases/download/v1.0.2/square.component.wasm"
    rescue StandardError => e
      puts "Other error: #{e.message}"
    end
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
