class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.184"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.184/trebi_0.2.184_darwin_arm64.tar.gz"
      sha256 "18cdd9cffcf9c36909fc558d41f15c3419ce36557ee9711c6e182b3860d7f80f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.184/trebi_0.2.184_darwin_amd64.tar.gz"
      sha256 "bcc9f2a96e59787f3a9be381a0274a31fcb0e75f2855d689674862aa8b18e3d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.184/trebi_0.2.184_linux_arm64.tar.gz"
      sha256 "3c65d2fb9bca3b74b662653e12a2a60750999cf0df02e8b40eb8ee4f24147f23"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.184/trebi_0.2.184_linux_amd64.tar.gz"
      sha256 "82caf6bc9ba63e66f061c69745a3db1732e635be1ce94b812dde3be7e3e0ce30"
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
