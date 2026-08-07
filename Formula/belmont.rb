class Belmont < Formula
  desc "Structured AI coding sessions with PRD-driven planning and verification"
  homepage "https://github.com/blake-simpson/belmont"
  version "0.10.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-darwin-arm64"
      sha256 "d4a4daffeb5cb3168e84905c5f4c4328f19cae4d004f4d2f9ae9f4c7f54d7d15"
    else
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-darwin-amd64"
      sha256 "e5e487d08c0bcc8904b63b33246c90e2868649cd03a967a1f5d427cb3cd97949"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-linux-arm64"
      sha256 "76fcd16131399a55e57f0dbe8050fc5a31a6ae36e4625fcaa5dce50b5856aad1"
    else
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-linux-amd64"
      sha256 "664d38dd3c8974972a2ba41245676bcf914a270dce2f34d110093149fb8eaa5a"
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
