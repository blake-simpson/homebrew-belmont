class Belmont < Formula
  desc "Structured AI coding sessions with PRD-driven planning and verification"
  homepage "https://github.com/blake-simpson/belmont"
  version "0.9.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-darwin-arm64"
      sha256 "9b02940bb6a73e1711d06121145eb3b4d7fb0b607c9f2051ddd6950e2e262668"
    else
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-darwin-amd64"
      sha256 "3e3b8b80b29ed85bb2152fbfc9656434c78e595f37bd9dcc472b9afb96256ac2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-linux-arm64"
      sha256 "f3df10f75d30a80a02705ed0c6965478d94c48c0ccd1d12aa97c88d34b201339"
    else
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-linux-amd64"
      sha256 "a7011880c542ea0a56b7dfce87eede27b02724e7334c44b76666b653f981c988"
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
