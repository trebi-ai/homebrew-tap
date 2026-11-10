class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.202"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.202/trebi_0.2.202_darwin_arm64.tar.gz"
      sha256 "b5a45b587ab96fdce3fc0ffadf987ae1b4c68f9e402555376b195652ff4b950f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.202/trebi_0.2.202_darwin_amd64.tar.gz"
      sha256 "2ee267e00043fc26756ffe66fe0ffa2a7f17a87da7ad134ec12123792a49d688"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.202/trebi_0.2.202_linux_arm64.tar.gz"
      sha256 "054c2ce324bd7a9d907ab97e41f6409f59c82648609e9deb6ae473a0e7e2650a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.202/trebi_0.2.202_linux_amd64.tar.gz"
      sha256 "9dfd33d017dd5015f5a52f80280f24ab5d7f7f1b84acadc4feb4c0a0ddce9d56"
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
