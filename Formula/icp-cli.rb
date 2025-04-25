class IcpCli < Formula
  desc "CLI tool for Internet Computer with WebAssembly component-based extensions"
  homepage "https://github.com/rikonor/icp-cli"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rikonor/icp-cli/releases/download/v1.0.3/icp-aarch64-apple-darwin-homebrew"
      sha256 "897f4284a2c1d9c957e4c860e40eae6f78b942b9daf5502700eca6e14d25a0a8"
    end
    on_intel do
      url "https://github.com/rikonor/icp-cli/releases/download/v1.0.3/icp-x86_64-apple-darwin-homebrew"
      sha256 "9bacee193e72a329995c3a6ba17eab386efcabb0ddd7fbd38a7ab6b2b5cd88b3"
    end
  end

  def install
    downloaded_name = File.basename(stable.url)
    bin.install downloaded_name => "icp"
  end

  def post_install
    begin
      system "#{bin}/icp", "extension", "add", "--name", "build", "--force", "--checksum", "9af6d6a71590119ac9152fca8e169bddfc91ffed40c1cae61551e70602708b12", "https://github.com/rikonor/icp-cli/releases/download/v1.0.3/build.component.wasm"
      system "#{bin}/icp", "extension", "add", "--name", "project", "--force", "--checksum", "4b9fb9ad59b129fafe877b8043753dae643bf3205d59b7ae852db63b987b0d77", "https://github.com/rikonor/icp-cli/releases/download/v1.0.3/project.component.wasm"
    rescue StandardError => e
      puts "Other error: #{e.message}"
    end
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
