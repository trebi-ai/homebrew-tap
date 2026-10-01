class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.39/trebi_0.2.39_darwin_arm64.tar.gz"
      sha256 "0cbd127c9cdd4ff73550509ccc24466de6765a29e5bc0d738ba88f9c46c9de37"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.39/trebi_0.2.39_darwin_amd64.tar.gz"
      sha256 "3cadb541688300311bfc49f6f9d2d2530292ac38cc89d1f477ac232c2383beae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.39/trebi_0.2.39_linux_arm64.tar.gz"
      sha256 "b765821054c00d0246aab87b630a3ea82670ad73bc970a433c924a1fc370ca4c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.39/trebi_0.2.39_linux_amd64.tar.gz"
      sha256 "11d8e71efb82c0e38d7f574cedd851b38419cfca28ba76baa6794b5527e02160"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
