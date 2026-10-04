class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.49/trebi_0.2.49_darwin_arm64.tar.gz"
      sha256 "8e9840704a362adddd09f0cb817556c2f06edadb1f25104a3aa46d5cc9461aaf"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.49/trebi_0.2.49_darwin_amd64.tar.gz"
      sha256 "f5f5543e2bc9d4fc7d7ed075683add8c2941d0505ff4221beaadc98855f0f438"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.49/trebi_0.2.49_linux_arm64.tar.gz"
      sha256 "8e2a0a686856cb582e2fb7d7d97018ed9bb2290ec134237b0ba6b0fed3da9d32"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.49/trebi_0.2.49_linux_amd64.tar.gz"
      sha256 "d63765d50e59ec22521ff8cf734d89cb7fd9ce19371149c6f4a14c62696a68fb"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
