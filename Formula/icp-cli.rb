class IcpCli < Formula
  desc "Command-line interface for the Internet Computer platform"
  homepage "https://github.com/rikonor/icp-cli"
  version "1.0.0"

  if Hardware::CPU.intel?
    url "https://github.com/rikonor/icp-cli/releases/download/v1.0.0/icp-x86_64-apple-darwin-homebrew"
    sha256 "549a72032e26b757850dc25cef5aac5898ec73c84b7e77b82b832e4575794a58"
  else
    url "https://github.com/rikonor/icp-cli/releases/download/v1.0.0/icp-aarch64-apple-darwin-homebrew"
    sha256 "225a18a266a77f3153c85b18aa3017a376ce39407370adf3928b5f2bc8aa37cf"
  end

  resource "multiply" do
    url "https://github.com/rikonor/icp-cli/releases/download/v1.0.0/multiply.component.wasm"
    sha256 "d00bb255307e073fb64eeb95d14f34870c2cc8583c9f5e52ebd791b18b4001c9"
  end
  resource "power" do
    url "https://github.com/rikonor/icp-cli/releases/download/v1.0.0/power.component.wasm"
    sha256 "812cbca369d7e5b6550bb1af15c924dc1f2e25e37c257a03b52fc040779b43ef"
  end

  def install
    bin.install "icp"

    resource("multiply").stage do
      system bin/"icp", "extension", "add", "--name", "multiply", "multiply.component.wasm"
    end
    resource("power").stage do
      system bin/"icp", "extension", "add", "--name", "power", "power.component.wasm"
    end
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
