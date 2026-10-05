class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.53/trebi_0.2.53_darwin_arm64.tar.gz"
      sha256 "af883a3f99b2305ff93fadead3de0894a7918d12aa0406d7933387346e86b6f3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.53/trebi_0.2.53_darwin_amd64.tar.gz"
      sha256 "a0e3ca9615202fc7436b7bd7b82a060b99af6119fc576cdf5bc3ba8241383261"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.53/trebi_0.2.53_linux_arm64.tar.gz"
      sha256 "d1613a0c98ff1edff0c36c4c389a2729a981f660b83efb913822a864b10c53ee"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.53/trebi_0.2.53_linux_amd64.tar.gz"
      sha256 "7877ef805c7a99455246c4e299481c8f2cd45a22bc335b3ced105d7073b35da1"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
