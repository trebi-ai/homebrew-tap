class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.213"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.213/trebi_0.2.213_darwin_arm64.tar.gz"
      sha256 "40e186c6feac6b6e310c70ced2bd7d6e7eb6bf6899fadc7fea7d868f3f592b2b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.213/trebi_0.2.213_darwin_amd64.tar.gz"
      sha256 "cdd3e3eef5fda657005cbdf28531c76d5c1ee26ae6def331737467c686702b90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.213/trebi_0.2.213_linux_arm64.tar.gz"
      sha256 "30e2798c0209bc23ef71b4987b673423e6f58bd488ad2a0c4720f65a29aaee9f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.213/trebi_0.2.213_linux_amd64.tar.gz"
      sha256 "0370c7fad482971247091346c6fbcea63d14767fbab608a47057fb3f7a2e4837"
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
