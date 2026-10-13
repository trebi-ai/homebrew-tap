class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.114"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.114/trebi_0.2.114_darwin_arm64.tar.gz"
      sha256 "953f8856f529f840d51a06c19cfee7c9c8a30190d5acb6e0dc239d28427f9d7c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.114/trebi_0.2.114_darwin_amd64.tar.gz"
      sha256 "35d59f9702574fc009c31b0d4870dd5bd3636e2b5288612a7b0e36327891aa3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.114/trebi_0.2.114_linux_arm64.tar.gz"
      sha256 "ce01724b1a06fe78215893cf97b88c023ea374709cbeea306dabd48239a8a2b4"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.114/trebi_0.2.114_linux_amd64.tar.gz"
      sha256 "ecfdb02aebed597c12e3ee1a6f28b1886ebf45fe28eb495e12e418fa6a826cb8"
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
