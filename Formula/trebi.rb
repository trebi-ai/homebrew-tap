class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.192"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.192/trebi_0.2.192_darwin_arm64.tar.gz"
      sha256 "e97dc2b630ad93fed9e9c75c2ccb1826fab07af9dba9f03325af8142b37117bd"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.192/trebi_0.2.192_darwin_amd64.tar.gz"
      sha256 "3f5781304ee7cc913ef66ac5fbb66177e6ec46b16bfcf0076523e15dcba77ed1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.192/trebi_0.2.192_linux_arm64.tar.gz"
      sha256 "0b4c4be4844fdf3b22b88d45b3b8ff0affe9f9c556920885be78a56df877a474"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.192/trebi_0.2.192_linux_amd64.tar.gz"
      sha256 "a301ae8e62a7ca078ce89a30c793edaa1569b7e0261ca1daa15974b063f65187"
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
