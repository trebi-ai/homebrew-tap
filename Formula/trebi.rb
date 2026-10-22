class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.148"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.148/trebi_0.2.148_darwin_arm64.tar.gz"
      sha256 "a2bee8e687517f40c309eb2c79d41a704ea82ce9a646ea17bf4ec1939d230234"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.148/trebi_0.2.148_darwin_amd64.tar.gz"
      sha256 "aee0ea910299aef1d1167019de5c270a970818226c5e41477c835c232f79b356"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.148/trebi_0.2.148_linux_arm64.tar.gz"
      sha256 "33e623a076711ebd0aa564a82af5954ef07186e2a1001e0aadd5a5c8b25d67e9"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.148/trebi_0.2.148_linux_amd64.tar.gz"
      sha256 "50ca0adadcbf1e3cdc0115f324834e0fe0968ecfed9b052d106cdbb4f81a8c2e"
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
