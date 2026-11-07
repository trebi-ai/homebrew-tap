class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.195"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.195/trebi_0.2.195_darwin_arm64.tar.gz"
      sha256 "6aa6d1475c889f9551541156c54ab707367e6ec788d4e5e3d0cf28ee7116e4c3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.195/trebi_0.2.195_darwin_amd64.tar.gz"
      sha256 "0136bf8318ea6e6b82fcda86fb9865b4ea7816cd9ec8099beb72bc57eff227d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.195/trebi_0.2.195_linux_arm64.tar.gz"
      sha256 "e5f6bd94ecde25b7cdbd10339e9b9f909f3408ce73a9fa0ef4c64e18a9699796"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.195/trebi_0.2.195_linux_amd64.tar.gz"
      sha256 "da7a49a010714ae5a8d419bdc76a2f9abab49ccc8d36fb048b2969b75e14832b"
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
