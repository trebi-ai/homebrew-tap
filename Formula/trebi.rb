class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.92"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.92/trebi_0.2.92_darwin_arm64.tar.gz"
      sha256 "f5d036deb0e9e72b5049ecea0417071bdac5365995bd9aeb6cbccb938a12f532"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.92/trebi_0.2.92_darwin_amd64.tar.gz"
      sha256 "3b64537063b38d1191fdf4c20a0a2be6e5dfc9a2af89f97edd7a8f54767c668b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.92/trebi_0.2.92_linux_arm64.tar.gz"
      sha256 "603c8a6cb74d85bed71a026195cdff1b8192caa49171ed1f68060959f6ed5abf"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.92/trebi_0.2.92_linux_amd64.tar.gz"
      sha256 "10e92deb0cf01e51e9648c5952b582fd182b4670811176a0ded522b70b7a630a"
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
