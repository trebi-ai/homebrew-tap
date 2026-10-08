class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.70"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.70/trebi_0.2.70_darwin_arm64.tar.gz"
      sha256 "58c6d8afcfc0dcd3c8244c832ff39d49f74fa37ec5df1c71dc0d6151eb48c8eb"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.70/trebi_0.2.70_darwin_amd64.tar.gz"
      sha256 "6c4ba3aef8422b2fdee72cdbb6888578c046be6d2abca2e63b744f95b41dea50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.70/trebi_0.2.70_linux_arm64.tar.gz"
      sha256 "9dbbbc57afe69481f4938a0a91ba30af3af7f0d65334be1b44353502fa25b8cf"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.70/trebi_0.2.70_linux_amd64.tar.gz"
      sha256 "d89e0b80acde07c82612593d61a64c88dc4207920a14fcd7c7918f65a38d7e33"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
