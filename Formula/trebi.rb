class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.168"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.168/trebi_0.2.168_darwin_arm64.tar.gz"
      sha256 "c292e17b0579ea3c2952aee271931203a5ad7cda9f530de03bc894f2e11c2bc3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.168/trebi_0.2.168_darwin_amd64.tar.gz"
      sha256 "e3f690aa1187d7ed0962320efffd968ac2e4d6e7dc2c23c4c87af8ee2fa9a474"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.168/trebi_0.2.168_linux_arm64.tar.gz"
      sha256 "af3a9d854c9df8f9796bb6ac8245bf860abe07274a4704214a93b43ad519124e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.168/trebi_0.2.168_linux_amd64.tar.gz"
      sha256 "b8efa79599adca3d3db28ededa538e223b6630eb2bf70661b5c5250818dbdf6c"
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
