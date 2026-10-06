class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.63"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.63/trebi_0.2.63_darwin_arm64.tar.gz"
      sha256 "b80b57c33bb3e9de7c035c267a9f5feea07f81456dd6a35335bd2d12a325fb28"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.63/trebi_0.2.63_darwin_amd64.tar.gz"
      sha256 "3a9fad0b4a592a1d65ca4a1e399b6d82570cca6a0059c12cfeaed903392b9b75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.63/trebi_0.2.63_linux_arm64.tar.gz"
      sha256 "6f2e3becb5d0c073012f1dd3bb3bf45893e5c800c8652e32d2a04449d9f56f44"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.63/trebi_0.2.63_linux_amd64.tar.gz"
      sha256 "fd929d78b63364e08679475d77ac5a620901c1e11e7a917be9387db56c98a3b0"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
