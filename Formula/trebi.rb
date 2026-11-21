class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.230"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.230/trebi_0.2.230_darwin_arm64.tar.gz"
      sha256 "35c4cfb20fa826fda4d97cbc3da237ae32beb357c33f80c935be72be3a491712"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.230/trebi_0.2.230_darwin_amd64.tar.gz"
      sha256 "cdd6c89c57841dbd6feeaa160afc8f7753320896c44eec9489d95745ae487f06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.230/trebi_0.2.230_linux_arm64.tar.gz"
      sha256 "1aff5418b34b2e09a6f378d4bdd1a0b39e3b25500c5aefe99a13502e6fbabd91"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.230/trebi_0.2.230_linux_amd64.tar.gz"
      sha256 "10601c0eb1684d538202e368d36ed228d4f756092d884e56589b43a937384c6e"
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
