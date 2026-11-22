class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.239"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.239/trebi_0.2.239_darwin_arm64.tar.gz"
      sha256 "3da7dec56b74191505c57a5145e6e9929e85f471091df2520b79cdbbe1d8087e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.239/trebi_0.2.239_darwin_amd64.tar.gz"
      sha256 "52276a3db732309231f731ca67be60ca326740f089c1be6a9a695b7b37c392eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.239/trebi_0.2.239_linux_arm64.tar.gz"
      sha256 "7869f69b81f5225a0db086de67b90e0006111a87bd69cee17e098efe894283e1"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.239/trebi_0.2.239_linux_amd64.tar.gz"
      sha256 "6cf45b29d290b778bda3ccb31cd6ac3718fcb354b26dc3d436dafed5e679c03b"
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
