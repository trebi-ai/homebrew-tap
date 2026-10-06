class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.61/trebi_0.2.61_darwin_arm64.tar.gz"
      sha256 "de6b76aa5641e14b3bb2f0bd79b87723b66939109651ad9511b42dfd6a0b453a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.61/trebi_0.2.61_darwin_amd64.tar.gz"
      sha256 "09ca51a8019f0c6e87be537bce74a35d4ea4a7c16dbffb0dc9a53916f43b567a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.61/trebi_0.2.61_linux_arm64.tar.gz"
      sha256 "c51f3b0d39ca469e6cbe4bb2116c0f1cc7029638e6dc7a934706a9f788fa728c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.61/trebi_0.2.61_linux_amd64.tar.gz"
      sha256 "afd7c3b45f61c142ece994faa086f272eceb1ba1f69642cab89a97d84896bc56"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
