class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.111"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.111/trebi_0.2.111_darwin_arm64.tar.gz"
      sha256 "1634c6e272a93f2f751e20afe6f0951b591ec770f180c23e302029f7a26a5387"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.111/trebi_0.2.111_darwin_amd64.tar.gz"
      sha256 "9712ff73e3f11c26d3393b4af5a5887d0c1cbe492d8690fb02dd21dfdd982412"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.111/trebi_0.2.111_linux_arm64.tar.gz"
      sha256 "ec30c3c515305a2f8f2f63fe702fb4bfb1c3d9c8bfa0bbaaec5da43d7287d5fe"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.111/trebi_0.2.111_linux_amd64.tar.gz"
      sha256 "addd5f221837d00c76f907af018ccbb8359512ac668baf8c96fc39a328d4f316"
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
