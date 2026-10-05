class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.58"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.58/trebi_0.2.58_darwin_arm64.tar.gz"
      sha256 "74b2cb576a0087dd7a47ef5fee6b9d6e54695d2e62249cd0aea6baab0c3e62c1"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.58/trebi_0.2.58_darwin_amd64.tar.gz"
      sha256 "0db9755012155c7b9692470ff31a275b1ccb44da416a31c830081e372123fbac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.58/trebi_0.2.58_linux_arm64.tar.gz"
      sha256 "e04fb6854f632bcef41812495525d3246bab2b9d6e6f3956751e722154173af5"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.58/trebi_0.2.58_linux_amd64.tar.gz"
      sha256 "486f73cb026d34d19053e60e95d7bf39ceebaba834fa868fd02d256f12c39e50"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
