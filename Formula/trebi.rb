class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.90"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.90/trebi_0.2.90_darwin_arm64.tar.gz"
      sha256 "32c099e18c5b1e925ebfb1ad27587acc1c7737fa7443ffc81982d4932645ad21"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.90/trebi_0.2.90_darwin_amd64.tar.gz"
      sha256 "f26f9a83cfabb182b56417ee66bfecdd6df3cae58f52732ef0e4cfd43f903076"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.90/trebi_0.2.90_linux_arm64.tar.gz"
      sha256 "c22c31c77920be7b53ccdaa90ebc9fae05282263d4d89fa2ede7441eed67a2bd"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.90/trebi_0.2.90_linux_amd64.tar.gz"
      sha256 "1570f485e8f61d625e2ef107f6117aef7f4b6cdff22d257cc2cddfd9fc0310d1"
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
