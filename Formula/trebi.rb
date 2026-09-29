class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.31/trebi_0.2.31_darwin_arm64.tar.gz"
      sha256 "a3a8d7637b387d75fe0a2a9c08980c3dacb8d5e7deabbd3effcf03641f0e4452"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.31/trebi_0.2.31_darwin_amd64.tar.gz"
      sha256 "058354b3502b0c5f439c9c6acc39012e01fcb52909057073da04b686195ac090"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.31/trebi_0.2.31_linux_arm64.tar.gz"
      sha256 "a665ecd93d6b14995c561dd506575b6635dbbf8028e243724616a98f3e25ee82"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.31/trebi_0.2.31_linux_amd64.tar.gz"
      sha256 "65837f9995109da082d5956a9b7cd7dddb3970bed711f3543da065cd73f176e6"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
