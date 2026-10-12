class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.103"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.103/trebi_0.2.103_darwin_arm64.tar.gz"
      sha256 "abd7ad3f91b642d27d29edda1259c5e5bed5cefd5f2873ab48f5ec6ac1d8bc8d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.103/trebi_0.2.103_darwin_amd64.tar.gz"
      sha256 "b95de204700a503622585a3811152f483d69c5b15b39542d0a6b05aeba6b3aef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.103/trebi_0.2.103_linux_arm64.tar.gz"
      sha256 "a9e8c997a0d7ba0fdac7e7b71ddd0f3630797d0c174804194798e949617f7909"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.103/trebi_0.2.103_linux_amd64.tar.gz"
      sha256 "1e72ed2b97e6b6385b3492bf0dceb73b00831885a76491a8f75150ed02fafbf9"
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
