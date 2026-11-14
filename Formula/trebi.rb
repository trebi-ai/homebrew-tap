class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.206"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.206/trebi_0.2.206_darwin_arm64.tar.gz"
      sha256 "43bd000f5e1e579236ee37d64dc469370244d22f332ff689ed54937e57dc6177"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.206/trebi_0.2.206_darwin_amd64.tar.gz"
      sha256 "8f5db585b85357d9b0062a4985a177ce6647f87e0447c129597671d23bc6a16f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.206/trebi_0.2.206_linux_arm64.tar.gz"
      sha256 "65a2d00519c7771c0424c5cbaa9d90f2b2a0c5b8b5e650dee6e2358021a8a1cf"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.206/trebi_0.2.206_linux_amd64.tar.gz"
      sha256 "bd4be5612554b578f6d6c3e7f3ede9c89f5cd704c6f72127919f02b5cfc474d8"
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
