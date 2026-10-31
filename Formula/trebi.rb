class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.169"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.169/trebi_0.2.169_darwin_arm64.tar.gz"
      sha256 "c3ce3dc243b5c1c917320ddcf45aa04a1a4e3585b67acfdb67d5096c51df0a87"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.169/trebi_0.2.169_darwin_amd64.tar.gz"
      sha256 "41d00947f038422e6087ade48b03c5763cbdfc19ecb70ad0aef2b5103244de0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.169/trebi_0.2.169_linux_arm64.tar.gz"
      sha256 "68dae994fb83e91b4b36be3ed823365d6d45e04052dae004a115b554fd4b40b7"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.169/trebi_0.2.169_linux_amd64.tar.gz"
      sha256 "792c75ce99d0129935ab4f406f7918d529e4ebec35d5978fcb9296bf15a70571"
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
