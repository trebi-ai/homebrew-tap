class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.26/trebi_0.2.26_darwin_arm64.tar.gz"
      sha256 "42227687990ac706bd2408067679e1e0b32d9d654f3eea8d982a23bae557f6b4"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.26/trebi_0.2.26_darwin_amd64.tar.gz"
      sha256 "3f34a91239561c74898587c87e45f42f7ff183b2f3aaa39675bc2507bd317d88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.26/trebi_0.2.26_linux_arm64.tar.gz"
      sha256 "e05e237cfc193e07e1646595510bd776b3eea0ee1fa01dbc6dca685eb755a97f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.26/trebi_0.2.26_linux_amd64.tar.gz"
      sha256 "b5e1c8d2d471817c9032eb338b92e302b76c2c5ef1544202692b89d367407d29"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
