class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.40/trebi_0.2.40_darwin_arm64.tar.gz"
      sha256 "1bc24f58fc81c1bef71c1aa228f33100dcfa858fe23c6032cf73cd57f89d9fa8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.40/trebi_0.2.40_darwin_amd64.tar.gz"
      sha256 "d3ae0b2b0bae336f94fc5a32a14289effe4c8b3324f6c8b4f6a2f6f2981e60c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.40/trebi_0.2.40_linux_arm64.tar.gz"
      sha256 "768fa2446dc7433ac9b7b5e1988ade3856601816a420f8c1d4bbade1ba6d7741"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.40/trebi_0.2.40_linux_amd64.tar.gz"
      sha256 "7c0d89ba1a994cfe6bdde71ab782c431ea1bfcf3d0dd54cf4d84fc34ad3ef784"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
