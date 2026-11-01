class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.178"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.178/trebi_0.2.178_darwin_arm64.tar.gz"
      sha256 "d0ea3df89d0fe557499b1ae83889e1a7beec0a55fec0d73efd191d6ff174fc27"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.178/trebi_0.2.178_darwin_amd64.tar.gz"
      sha256 "2657236ec8c13d6222078b1a286d68fb813f47a91814c2462a95986820ce29fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.178/trebi_0.2.178_linux_arm64.tar.gz"
      sha256 "e3214d48c9d3e221348f699661502a6e977aae34f9546968ba9e578351e2dc35"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.178/trebi_0.2.178_linux_amd64.tar.gz"
      sha256 "7ebde053baa02e34088537d75d150e651d9968b61ed63b6f980b08b23159b181"
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
