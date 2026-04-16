class Belmont < Formula
  desc "Structured AI coding sessions with PRD-driven planning and verification"
  homepage "https://github.com/blake-simpson/belmont"
  version "0.9.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-darwin-arm64"
      sha256 "f26ac55c65ea0f57c43930c104a2bd0f63c8dab6aaadfe7f65b2f014dad29168"
    else
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-darwin-amd64"
      sha256 "deda0e40d8200e2adf79c6f2b78d71cb96e6b057545023504a37a70ec9f3a3e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-linux-arm64"
      sha256 "0e4a22e239517f1592ba790c0bd60cf670c5e55b06d79ac1ca61b57f1e59f252"
    else
      url "https://github.com/blake-simpson/belmont/releases/download/v#{version}/belmont-linux-amd64"
      sha256 "b7b458508f2e220d29f42ef51245adc1ac0f77f213efdc739b1c13d8712bdd69"
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
