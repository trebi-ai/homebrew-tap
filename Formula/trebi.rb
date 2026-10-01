class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.41/trebi_0.2.41_darwin_arm64.tar.gz"
      sha256 "a39311c42f16598bf81c1c3881962155f3fcefa3ebc8e1943ef9ffff329c509e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.41/trebi_0.2.41_darwin_amd64.tar.gz"
      sha256 "89d00f727afca1d0b21de7f4a9e30307fd6a8e84dbc56cff8c4462ec471424cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.41/trebi_0.2.41_linux_arm64.tar.gz"
      sha256 "c581975c3a6ad7facbb13e394b5625e077da6058d44c85c8bb3c371c4b5e1bba"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.41/trebi_0.2.41_linux_amd64.tar.gz"
      sha256 "8774b9730307d0e696d0b7323ce0dba95c278039d7b1e77c9565a9fced79eaf1"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
