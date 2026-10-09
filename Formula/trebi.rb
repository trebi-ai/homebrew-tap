class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.77"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.77/trebi_0.2.77_darwin_arm64.tar.gz"
      sha256 "e69732afb760deb3bca2a5295d3d0795c6c8938bed6b934d486489f325dc3288"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.77/trebi_0.2.77_darwin_amd64.tar.gz"
      sha256 "9c34338296bf10f706196dc04d07baf42abf7d8d056ca003d20de994fdaffd2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.77/trebi_0.2.77_linux_arm64.tar.gz"
      sha256 "23ea67313b5dc6af74f69e093fe4c7d578af54e9f67e730c49ee50b0804b1696"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.77/trebi_0.2.77_linux_amd64.tar.gz"
      sha256 "2fa306cc30ca2fab36d7dda0d34cd331d4651a3c11bba9151a2cd72c71e46cec"
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
