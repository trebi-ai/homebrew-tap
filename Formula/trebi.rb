class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.151"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.151/trebi_0.2.151_darwin_arm64.tar.gz"
      sha256 "c86f3966173ec821b5bc3c0922510e72ea3b847aba68b38f548003067a4a95d0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.151/trebi_0.2.151_darwin_amd64.tar.gz"
      sha256 "7ded816d99745a09b219e8609f7eb1501e26280bfe6bd4a4c7ad2ca641f521db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.151/trebi_0.2.151_linux_arm64.tar.gz"
      sha256 "f2e41f4ae2eab8b1908d035bc6488d392bb4d28e5802fb4a7e9aa035a4e523c6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.151/trebi_0.2.151_linux_amd64.tar.gz"
      sha256 "ca5d3c340f41f6c65e8814903b0367b2174d9304e60740cdfde16e81dbe6de9a"
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
