class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.84"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.84/trebi_0.2.84_darwin_arm64.tar.gz"
      sha256 "f4e96f376ebf3497f92ca1989af244dfa100fc1a3ffbc47d4ee7086dc4114f0f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.84/trebi_0.2.84_darwin_amd64.tar.gz"
      sha256 "83cd77b75f266d3d45025aa872cce918b898ce0865fe4dc1a32058bbb0ac7538"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.84/trebi_0.2.84_linux_arm64.tar.gz"
      sha256 "293b8001a29904b07a0ce77fb68bd3abf2ae459e59e69deaf7c7bb5a244b83ab"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.84/trebi_0.2.84_linux_amd64.tar.gz"
      sha256 "aca7bc6039ced3b1c494c8f6dab036dd7b231ec920f6f20fe2f0e4e9f790769a"
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
