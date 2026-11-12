class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.203"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.203/trebi_0.2.203_darwin_arm64.tar.gz"
      sha256 "b45e335582eb9646939f66e5f4b4e8144b15df18e1518d46a910c38e33a78126"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.203/trebi_0.2.203_darwin_amd64.tar.gz"
      sha256 "88473e8904982af65aa7ec28d5323ceb81841a09df242c074e20e12a6917e5bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.203/trebi_0.2.203_linux_arm64.tar.gz"
      sha256 "af786b72227b0cdea47e051c78e71a454a3e43bd53ddd108913fc96014a1aae9"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.203/trebi_0.2.203_linux_amd64.tar.gz"
      sha256 "d4fd03281a7ad658bb13ed18223c94c5230c08de04719e277ee7fc4e157d1909"
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
