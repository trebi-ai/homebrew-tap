class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.174"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.174/trebi_0.2.174_darwin_arm64.tar.gz"
      sha256 "361fbdda22e764cc19fc1967d85cd9d5563ea8dab417c39bcd4949c4f8c3b891"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.174/trebi_0.2.174_darwin_amd64.tar.gz"
      sha256 "35fa681f2bff313ef4f9360a89c1ecb80ad31cd991c66643f76f0d738933fc3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.174/trebi_0.2.174_linux_arm64.tar.gz"
      sha256 "0a82d2613b00313aec2534a01c36831e17e44073c8985f54e1de5f1baab2a1a3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.174/trebi_0.2.174_linux_amd64.tar.gz"
      sha256 "416ce920c8d86b8d5a28d78981af8beade57a0e480492967294a52247e433540"
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
