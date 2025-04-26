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
