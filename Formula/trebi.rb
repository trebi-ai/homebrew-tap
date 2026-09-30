class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.36/trebi_0.2.36_darwin_arm64.tar.gz"
      sha256 "dd2200373180b6c5cecf7c2abd56123911ccc3afed5120ac3c827ac796369ba2"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.36/trebi_0.2.36_darwin_amd64.tar.gz"
      sha256 "d8911dba4d009727e9ab77142fb0ed7050e0193a2df37c73ec8acde9f1c3afe4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.36/trebi_0.2.36_linux_arm64.tar.gz"
      sha256 "cf5c27200f4e6992eed49e2651b5c55b592a573dbef5fcf0afb457683c3100df"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.36/trebi_0.2.36_linux_amd64.tar.gz"
      sha256 "b8d9fd6e68acdbc26a0a38f3f268a47b2c33cd8b838f1990f61515227216621a"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
