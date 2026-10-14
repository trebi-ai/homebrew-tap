class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.127"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.127/trebi_0.2.127_darwin_arm64.tar.gz"
      sha256 "c11e9551f0a5f379bddb4f6a107e738463d058465009cc22bd8e05371a478f48"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.127/trebi_0.2.127_darwin_amd64.tar.gz"
      sha256 "6090ad7105782897994c139eeeb80f92ee54927980308478fcf0956749cee977"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.127/trebi_0.2.127_linux_arm64.tar.gz"
      sha256 "c241d809f5beda25b76bd30dfc856fc4f58f4fd23130b9563db8afc881f5618f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.127/trebi_0.2.127_linux_amd64.tar.gz"
      sha256 "e89840204cb9acdb995ea116e59d9fdc23c53c3c131027d58e4097cf146e4a4b"
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
