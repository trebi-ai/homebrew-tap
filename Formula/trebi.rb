class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.97"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.97/trebi_0.2.97_darwin_arm64.tar.gz"
      sha256 "5c6e9ae4c5622d3bbe307d456bd736e78ae5c2d26ad962257a348f97bb5bad19"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.97/trebi_0.2.97_darwin_amd64.tar.gz"
      sha256 "7fb53c1d542f030bbcc619cb6863544b76790583572a379a1c4ac6e710c033ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.97/trebi_0.2.97_linux_arm64.tar.gz"
      sha256 "432f6729bfba336f146f0c7f8f4fb04c757eda1380447db1e10b7e7dce0f7747"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.97/trebi_0.2.97_linux_amd64.tar.gz"
      sha256 "e20e0bd22fb45e3285ee007e3517706004c2670d48bdf94c7326cc84c525cca9"
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
