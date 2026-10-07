class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.68"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.68/trebi_0.2.68_darwin_arm64.tar.gz"
      sha256 "d02178ba2f7695251766520a14bc004f9540706b1c72f7054aa15e2fae8230da"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.68/trebi_0.2.68_darwin_amd64.tar.gz"
      sha256 "b643bfeedb1a60150080d6b7992911b7ff554d86200055e2e205dcd8840dfaf4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.68/trebi_0.2.68_linux_arm64.tar.gz"
      sha256 "e4b5c60eddb9067e6acb86d3fad900a470077ac85b00e57817b301e9ba013069"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.68/trebi_0.2.68_linux_amd64.tar.gz"
      sha256 "efe0e35b528f663e78954a9df894abb27f871a4c1032852a5db2a5248daa62ad"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
