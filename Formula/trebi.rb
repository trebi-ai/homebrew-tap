class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.225"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.225/trebi_0.2.225_darwin_arm64.tar.gz"
      sha256 "73bd7490179cc4d5b652eb6cb9c34f8cc71b68b6a93554b3d792467fd8f892f6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.225/trebi_0.2.225_darwin_amd64.tar.gz"
      sha256 "f340d9d90eef29c154bf141d5801ce3827062523fa729a6310f9d3d0da699796"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.225/trebi_0.2.225_linux_arm64.tar.gz"
      sha256 "94a9bb9b3065d472e582fedea2729613993ecb94e1d853db9d3cc326a3ee29cd"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.225/trebi_0.2.225_linux_amd64.tar.gz"
      sha256 "975492f9e60860d6779ae26504bd4328c19462894cc5a0b3dce3169b7f99680e"
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
