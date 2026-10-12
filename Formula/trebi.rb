class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.104"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.104/trebi_0.2.104_darwin_arm64.tar.gz"
      sha256 "adff7652e2e1c8e21ee56d2076b5b656cc6d37e3218bf9fc7b82500652b9cdaa"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.104/trebi_0.2.104_darwin_amd64.tar.gz"
      sha256 "6f5ca37f96e56aac3de4fbd3fdf67fca86a53195839867bf3a0ee81005ee10fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.104/trebi_0.2.104_linux_arm64.tar.gz"
      sha256 "d50579f13efb0a06bca4276af780ea10cb46e8ed15e9d16c81339c352e139324"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.104/trebi_0.2.104_linux_amd64.tar.gz"
      sha256 "b022862a4fb94f54272739c4063c9ade88920147b8fa7e55e8c487e7d9f56587"
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
