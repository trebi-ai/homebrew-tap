class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.189"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.189/trebi_0.2.189_darwin_arm64.tar.gz"
      sha256 "3bb7a091aea951fb6a6bb68856a9595038917bc656f19593e65fc1bdb647118f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.189/trebi_0.2.189_darwin_amd64.tar.gz"
      sha256 "ae771f360ca9314179e1fb6763ce4cc6544ab1541cb2ad29d2f62bd95fcb36d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.189/trebi_0.2.189_linux_arm64.tar.gz"
      sha256 "6d583b904f51d5fb158e4311982f0fff17850c63ad18f5236da85ad74be27dad"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.189/trebi_0.2.189_linux_amd64.tar.gz"
      sha256 "04813936bc825a53b7bea375686c1a43a417f6bc3b91aae485af45f317017dd8"
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
