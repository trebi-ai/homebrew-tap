class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.86"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.86/trebi_0.2.86_darwin_arm64.tar.gz"
      sha256 "a661d27438520df5810772f15e0256420523e000f9c5b22e7fb4fef0af9d9291"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.86/trebi_0.2.86_darwin_amd64.tar.gz"
      sha256 "bebd9dd9c7ad9cf11486ebb83512c3f6f3dd0f21d38c580e951a0678a74d7e8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.86/trebi_0.2.86_linux_arm64.tar.gz"
      sha256 "01183b4244c446232d644287379dc2209776ac33270ec4fd79731bde97e40c1b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.86/trebi_0.2.86_linux_amd64.tar.gz"
      sha256 "db7265a86f94d1d093c3bf37535561e094e3a3f6b79f1c9c19ebe58fd114b2ff"
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
