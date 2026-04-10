class Belmont < Formula
  desc "Structured AI coding sessions with PRD-driven planning and verification"
  homepage "https://github.com/blake-simpson/belmont"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-darwin-arm64"
      sha256 "65a3af7a6183a76f3f576ed7f7e166e712f50f2d0e83d365a8e82e59f651b9db"
    else
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-darwin-amd64"
      sha256 "6e82bea8ce7e5fd8ff5cfad60f064f1fa31a9d3ef82a146dd6a9afebd0d8c847"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-linux-arm64"
      sha256 "56715d191a2251e539a8edd0c2ba1b033f520b5725ff6d14df5ebec3c42c760f"
    else
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-linux-amd64"
      sha256 "de4c8daa36844f2bb188b30f206876269a35eae4b222643bbcad46a6eda98077"
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
