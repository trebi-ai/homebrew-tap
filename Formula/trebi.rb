class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.163"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.163/trebi_0.2.163_darwin_arm64.tar.gz"
      sha256 "e073c37e5584a55b10bc945bd67aa64666291c7393e7b83664cf8ed4f3205bdc"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.163/trebi_0.2.163_darwin_amd64.tar.gz"
      sha256 "d32ddb81e75ee79b0da751d09f5dd2080f8530a0cca126eb99a180ff99d2e181"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.163/trebi_0.2.163_linux_arm64.tar.gz"
      sha256 "f03b5530d4b2d204f60ecd8d38028ee34b593ba2825b8f662ad4b643a4c7b2d6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.163/trebi_0.2.163_linux_amd64.tar.gz"
      sha256 "c5d878f4a248573d99debb6d102aaa87be6462ee8039755d60ff388230bfc43d"
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
