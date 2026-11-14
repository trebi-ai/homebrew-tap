class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.208"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.208/trebi_0.2.208_darwin_arm64.tar.gz"
      sha256 "6f4f19db0134b8f34816d61509b8c57c690c86a202743b867dfb1d32f154baa8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.208/trebi_0.2.208_darwin_amd64.tar.gz"
      sha256 "1148f0cfaa09c0363e7b50b10d2bfd5197469a7b3c3291f1b5f187d0e53ff473"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.208/trebi_0.2.208_linux_arm64.tar.gz"
      sha256 "7630b970e769330d7dcd4be5c5fe1f48424ba8c75167608a38259e5c7ab7291c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.208/trebi_0.2.208_linux_amd64.tar.gz"
      sha256 "2c2590d66297e07031c3e825beb08b64357347ca5052a2f8c1d28244e128cd98"
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
