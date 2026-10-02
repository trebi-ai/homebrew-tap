class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.44/trebi_0.2.44_darwin_arm64.tar.gz"
      sha256 "1ce2fe55323470354a605d9aec1be4e70ed9a9eb6e97b31a00f0815315082ccb"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.44/trebi_0.2.44_darwin_amd64.tar.gz"
      sha256 "75675a9a1d299c01b5d5ae9b5aacd101077acf3a7086cddeb373655243a66f46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.44/trebi_0.2.44_linux_arm64.tar.gz"
      sha256 "e108a9ce506cf845e831c126c4ceb65934c99f6956c89e9a5878df7b9483f7a7"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.44/trebi_0.2.44_linux_amd64.tar.gz"
      sha256 "8e28eec2a483ff8af0784876c7d221e01f3627ad30017f8f329ea99e5e555c52"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
