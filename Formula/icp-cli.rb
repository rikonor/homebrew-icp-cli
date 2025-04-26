class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "v0.1.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.13/icp-aarch64-apple-darwin-homebrew"
      sha256 "729d8e907992bfc1888ee1c205519fc3fb8fa7dc8c721fca5e1b17eece477d49"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.13/icp-x86_64-apple-darwin-homebrew"
      sha256 "753c9279757dcf2ccdcdab9c4ac6c3cfdc27ec10e749209b7ac45fafd2197214"
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
