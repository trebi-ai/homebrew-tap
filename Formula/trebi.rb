class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.91"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.91/trebi_0.2.91_darwin_arm64.tar.gz"
      sha256 "1016d78905ffbc95889030329ea51dd6a35f2ee207f33e29c96697971b1e7ba2"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.91/trebi_0.2.91_darwin_amd64.tar.gz"
      sha256 "f766e74f1c70432e61aed2e10aaf46c25dbb231d8a4071e307db9dfaec02de13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.91/trebi_0.2.91_linux_arm64.tar.gz"
      sha256 "077a3dd5c94165f8ebd2df4372be20fd763780e2fc08fc519ed85beef99a4f60"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.91/trebi_0.2.91_linux_amd64.tar.gz"
      sha256 "6fd84c89db97199fb96f518a5cac3963ccfca7dabe4176d6943e86ef5c294e18"
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
