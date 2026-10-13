class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.118"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.118/trebi_0.2.118_darwin_arm64.tar.gz"
      sha256 "1b8bd5168b1d98838d119ad0e71f2e2815f6356114f3d2d04bad3bafbcde99cf"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.118/trebi_0.2.118_darwin_amd64.tar.gz"
      sha256 "97ee8c9177b6e51d30025e74fa72581cba15ae209a2e87936fdfba9b48fe8c5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.118/trebi_0.2.118_linux_arm64.tar.gz"
      sha256 "86dca47887e8262f4c11ea7727c1b4a49ea3e201a922050674dcee56ddbc2d2f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.118/trebi_0.2.118_linux_amd64.tar.gz"
      sha256 "46448c2de5407a26173d42d0d6303eab56f5295ea596ff8e6d4932092116833c"
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
