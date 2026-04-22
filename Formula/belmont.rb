class Belmont < Formula
  desc "Structured AI coding sessions with PRD-driven planning and verification"
  homepage "https://github.com/blake-simpson/belmont"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-darwin-arm64"
      sha256 "8cedb353a7ec465b6a4fe070c095d9ff14626bc69424e8adf394178b87b88968"
    else
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-darwin-amd64"
      sha256 "3dc69198aec35a0883a42a665708f75c9fb4aec8af22c723bdfb7b6b44af5fcb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-linux-arm64"
      sha256 "a4d4c47055df5045b2cf2a51755cb91b5451d2511f845f5d0d1967936b23444a"
    else
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-linux-amd64"
      sha256 "819ad8d3e34c46872e83ae0025657dfdaaa646ae40703220bd1dd32aaf427f48"
    end
  end

  def install
    binary = Dir["belmont-*"].first
    bin.install binary => "belmont"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/belmont version")
  end
end
