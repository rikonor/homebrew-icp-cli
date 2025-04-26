class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "v0.1.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.17/icp-aarch64-apple-darwin-homebrew"
      sha256 "ee51599748562aade098046262c108fb2161d7960d03babe1a1dcd19b24f1b43"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.17/icp-x86_64-apple-darwin-homebrew"
      sha256 "b668f74c5efe697b93d80ca68d7a5eb551ce5e25ecf54d76270386bc167ec196"
    end
  end

  def install
    downloaded_name = File.basename(stable.url)
    bin.install downloaded_name => "icp"
  end

  def post_install
    begin
      system "#{bin}/icp", "extension", "add", "--name", "build", "--force", "--checksum", "541af48f597f470099083031f5d0f109ef02fe8cf9e90aa2cf60dda1a555b071", "https://github.com/rikonor/icp-cli/releases/download/build-v0.1.1/build.component.wasm"
      system "#{bin}/icp", "extension", "add", "--name", "identity", "--force", "--checksum", "16ebef202b88644c4290f719d84cace599dba163413332f810de8d04728bd835", "https://github.com/rikonor/icp-cli/releases/download/identity-v0.1.1/identity.component.wasm"
      system "#{bin}/icp", "extension", "add", "--name", "project", "--force", "--checksum", "8bc7d8ce09fcc0f5ca62c1e39e762473754fd3ebf4b6b2fefe34092649496a0b", "https://github.com/rikonor/icp-cli/releases/download/project-v0.1.3/project.component.wasm"
    rescue StandardError => e
      puts "Other error: #{e.message}"
    end
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
