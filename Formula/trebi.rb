class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.124"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.124/trebi_0.2.124_darwin_arm64.tar.gz"
      sha256 "324e8653359f4fe38abd10b3e1ae94b7f6cd01c43c8b8e1db9a4c1bb7fe1e6fa"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.124/trebi_0.2.124_darwin_amd64.tar.gz"
      sha256 "715d8c0d9f0da947160cb15d6ab9e33241e32e538ac6e68c3736d60612f6228d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.124/trebi_0.2.124_linux_arm64.tar.gz"
      sha256 "12a32c4373abf548b320d07229c214cd1102296054a81b47325abdc7989c109d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.124/trebi_0.2.124_linux_amd64.tar.gz"
      sha256 "a008cbf0fd3b449bfee9020fae5fd4b0040b37047da42f03d5766e272312ad07"
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
