class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.226"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.226/trebi_0.2.226_darwin_arm64.tar.gz"
      sha256 "fa5235fcc4ae517da4d84c7e6fa5c3fa33f8e8a65c540593a5178d6408653252"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.226/trebi_0.2.226_darwin_amd64.tar.gz"
      sha256 "7ba854f52131ea516ebc3d3a92c5288acd16ce8e41d284e5b5398ea9045b0b3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.226/trebi_0.2.226_linux_arm64.tar.gz"
      sha256 "dbcca7ec80803817cd4ef766ba671d67cd16cee56abf90816c0bc8d3227f3d64"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.226/trebi_0.2.226_linux_amd64.tar.gz"
      sha256 "e9a2ef2984ac11df32b9b4abbf9c49a61c28c58577f5d29780b2b4885f58c19a"
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
