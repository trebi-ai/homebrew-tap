class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.204"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.204/trebi_0.2.204_darwin_arm64.tar.gz"
      sha256 "6d76d9eb2f55551d58768969665170421b9d94fef8e9c660b953d003f8566835"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.204/trebi_0.2.204_darwin_amd64.tar.gz"
      sha256 "d055483d616ba48e8e3a0db87dd0a11371017019fb28b5835438b68b73f69d6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.204/trebi_0.2.204_linux_arm64.tar.gz"
      sha256 "2413a41f27007627cf671b4c69cc77e84ef0625eb3600674fd48fe9e5b49f483"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.204/trebi_0.2.204_linux_amd64.tar.gz"
      sha256 "ea8e41579ea66d3d2a80e98a946c2324f1b44537586122b8bebf7f4830470e72"
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
