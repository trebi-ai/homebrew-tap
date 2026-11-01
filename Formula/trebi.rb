class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.179"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.179/trebi_0.2.179_darwin_arm64.tar.gz"
      sha256 "65613717fb7254f7969024ba24ca4398fe38187578c238498814eeffeab84190"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.179/trebi_0.2.179_darwin_amd64.tar.gz"
      sha256 "ed86d8937eedd6f188f0a4c3ec13035462434c73da66296b3778d20d4f8c2be2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.179/trebi_0.2.179_linux_arm64.tar.gz"
      sha256 "5a27e46f069f0ea9985be9491cfb7b85980e67688345caa56a3fa648eb51bc72"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.179/trebi_0.2.179_linux_amd64.tar.gz"
      sha256 "90029182dedf542d82dcef44ada7bffabecc81705728a9ae0801c11212127f5a"
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
