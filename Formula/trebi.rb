class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.211"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.211/trebi_0.2.211_darwin_arm64.tar.gz"
      sha256 "bc402a5914e9c555f017699d7f6765307fefc17fec6ee9b453ff955ab4ab09da"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.211/trebi_0.2.211_darwin_amd64.tar.gz"
      sha256 "a62e86440b218e79345e388ca4d55b056cf269ded678741bc0c9b910e10019a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.211/trebi_0.2.211_linux_arm64.tar.gz"
      sha256 "4149273de779e4be2fd457c9f7d9eb167e0465a5a76b9d22a67c0f0be4a66eed"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.211/trebi_0.2.211_linux_amd64.tar.gz"
      sha256 "dc2b05531874e986040d434a4db4d8f6af2dd04cb764669775d5bdaa01ec099c"
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
