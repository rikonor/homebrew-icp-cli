class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "v0.1.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.19/icp-aarch64-apple-darwin-homebrew"
      sha256 "35901c53af6f18392fc8120fb92ba99c575e0ae17eecc96bd8dac6575d24847d"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v0.1.19/icp-x86_64-apple-darwin-homebrew"
      sha256 "c018ca09cde63eeb13805dfc5c14003b333243234abb83aeb75b95ac0f740a53"
    end
  end

  def install
    downloaded_name = File.basename(stable.url)
    bin.install downloaded_name => "icp"
  end

  def post_install
    begin
      system "#{bin}/icp", "extension", "add", "--name", "build", "--force", "--checksum", "a8ea58d35c7c79097646e7e37adafa20e70131b2d18a615d2d57ec20ffaa115b", "https://github.com/rikonor/icp-cli/releases/download/build-v0.1.3/build.component.wasm"
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
