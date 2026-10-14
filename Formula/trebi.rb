class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.126"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.126/trebi_0.2.126_darwin_arm64.tar.gz"
      sha256 "af9010a766d8bdac6adc0edced0eb573500628f28ac231add400657c24588890"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.126/trebi_0.2.126_darwin_amd64.tar.gz"
      sha256 "7797bb831589e0ce590e40eabba625559f5628de7043587a3239d2a2adb0bb75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.126/trebi_0.2.126_linux_arm64.tar.gz"
      sha256 "eb57b13a153c1c7ef9d6079406536ce4e535195ec44705810b7f002c42b89891"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.126/trebi_0.2.126_linux_amd64.tar.gz"
      sha256 "7fcac240c491b10374c9427aa4b268ece6fdab2999637e5197090c30d5425ddc"
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
