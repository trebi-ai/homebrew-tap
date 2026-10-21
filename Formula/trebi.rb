class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.145"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.145/trebi_0.2.145_darwin_arm64.tar.gz"
      sha256 "b2707c8667116d31cf47c27ed4288cb9bb6661a4ede5df97532ab2f9b3364e10"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.145/trebi_0.2.145_darwin_amd64.tar.gz"
      sha256 "87061db511390cb9b56193ea025f31a30f00851d8b8973982aabf65db897909e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.145/trebi_0.2.145_linux_arm64.tar.gz"
      sha256 "381d7eb9692d26e01f06479623db8c401735d51d605a3ed4184da620364a29f3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.145/trebi_0.2.145_linux_amd64.tar.gz"
      sha256 "f66f0626b9ae44bdc33c7cb938b649f486c609df9248d7f857fa66d0e99f166c"
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
