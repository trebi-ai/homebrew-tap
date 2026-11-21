class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.234"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.234/trebi_0.2.234_darwin_arm64.tar.gz"
      sha256 "b3ad1282aff1b563e727043f673524b7c5b39d52dbc337a5a49ffea9fe82ab0e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.234/trebi_0.2.234_darwin_amd64.tar.gz"
      sha256 "9b64189523664fdec77514b491eb342fdd95fccd21a4241ba372a21fe24d6397"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.234/trebi_0.2.234_linux_arm64.tar.gz"
      sha256 "4e44d298d3717e4f2e55e5fff483aa3297c15c1bc169d6ce1da29c25c9e4c2b6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.234/trebi_0.2.234_linux_amd64.tar.gz"
      sha256 "7593865bdd0d4c820e653c1226b1bb9a14b8d5aa34c7498ff5ba6eca1b279c13"
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
