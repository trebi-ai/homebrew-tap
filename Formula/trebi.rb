class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.155"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.155/trebi_0.2.155_darwin_arm64.tar.gz"
      sha256 "285d81a6de9a495e03ac0da161211c86a169ffaea692421a1669a1dde33882b6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.155/trebi_0.2.155_darwin_amd64.tar.gz"
      sha256 "278e23c045d17e10852a9e4204e1fc1d06b6b0ed4526c8261fe1e1890d9d10ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.155/trebi_0.2.155_linux_arm64.tar.gz"
      sha256 "0a0e7eaf386edd8a90a1c7d6cc4e6c978e608c2b057e4efa445dd301e8fbfbb0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.155/trebi_0.2.155_linux_amd64.tar.gz"
      sha256 "3ed7182845ede66e640f62ddd05c6c82aae4c185b08e33777c9a7541d9765689"
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
