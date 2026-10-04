class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.50/trebi_0.2.50_darwin_arm64.tar.gz"
      sha256 "b8277b1fafadb4999398d3279d4c560408a72eb637a0d733c9210f69232c7a86"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.50/trebi_0.2.50_darwin_amd64.tar.gz"
      sha256 "cad9468ce6dcade5faa60fcc2c918a0af09af2fa5875714786488655ca3f58a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.50/trebi_0.2.50_linux_arm64.tar.gz"
      sha256 "bb0c89427bebb1d5643b58ed7707bf83fbd5846f3c60753a3cba453abec6bafb"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.50/trebi_0.2.50_linux_amd64.tar.gz"
      sha256 "05107dd8245b4f499bdc72760e4bf64903e7268b9c426f3fbd164fe0aaac80ac"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
