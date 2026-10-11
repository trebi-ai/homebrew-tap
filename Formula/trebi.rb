class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.94"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.94/trebi_0.2.94_darwin_arm64.tar.gz"
      sha256 "b232d707232c3003c341fd90cc3148bc453aab210384fe4f616ca55e698f2931"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.94/trebi_0.2.94_darwin_amd64.tar.gz"
      sha256 "9d21632cd241f7f0c52b17212eed7b4cdcc0cddf705395e5f82f2169b539e2f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.94/trebi_0.2.94_linux_arm64.tar.gz"
      sha256 "23d09261a82729f794fad77a2ab201059c61e681be9685f9df61018f1eb5e8ca"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.94/trebi_0.2.94_linux_amd64.tar.gz"
      sha256 "42f8e1fe3f773c1258aa8c75f29e0400dbe0e56c397b588b7d482e5ca9c268d7"
    end
  end

  def install
    if OS.mac?
      prefix.install "Trebi.app"
      bin.install_symlink prefix/"Trebi.app/Contents/MacOS/trebi"
    else
      bin.install "trebi"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
