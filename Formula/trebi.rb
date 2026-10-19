class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.133"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.133/trebi_0.2.133_darwin_arm64.tar.gz"
      sha256 "9577226a9c31d6201d4f2e8fd75ba36265173f1fef21c78dde67f13175b06e2e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.133/trebi_0.2.133_darwin_amd64.tar.gz"
      sha256 "46886adea21b4c273a998063119fff98b945c0264726a20e84d85405352a303b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.133/trebi_0.2.133_linux_arm64.tar.gz"
      sha256 "daea7db7265aaab043bdcfb3ad9e1ad20a688e73f0f5d733babae80b0be70809"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.133/trebi_0.2.133_linux_amd64.tar.gz"
      sha256 "e119f7c3e46fbe27e5c7db61b2d7a2a59dc2cf6b61b3e6099c06d2df1b56b049"
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
