class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.221"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.221/trebi_0.2.221_darwin_arm64.tar.gz"
      sha256 "31c2e598b92662342305012e7b8ca54b8e4ca1d01508efb037f7a26b9e3a696a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.221/trebi_0.2.221_darwin_amd64.tar.gz"
      sha256 "8321feb252c3db74ecc30a1aa8b2c2a524cb2ed54751a3e65b06333edb7473f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.221/trebi_0.2.221_linux_arm64.tar.gz"
      sha256 "d4452f4e50d80cc31f862a756af0228360bdae62c1af4627447e90659640fedf"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.221/trebi_0.2.221_linux_amd64.tar.gz"
      sha256 "f2b742b6ea99219ad7ceadcccb4265ea9d040a9174cfd34b3b268f915d62b11d"
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
