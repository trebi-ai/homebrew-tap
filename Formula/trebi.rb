class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.38/trebi_0.2.38_darwin_arm64.tar.gz"
      sha256 "486d1afcd51c8e8b3d56251d08f1efd80a6406e350d7c2c8a312ce4f2e686b7f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.38/trebi_0.2.38_darwin_amd64.tar.gz"
      sha256 "65e8d6b774cdb2e6c164001317a571813012a7bceb75510dd85ba4ff86ac53a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.38/trebi_0.2.38_linux_arm64.tar.gz"
      sha256 "e11cc7863759ad12e09358428c955879ef6be48803a96e119153802d72200551"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.38/trebi_0.2.38_linux_amd64.tar.gz"
      sha256 "95f62dac6ef1446dfa1e796963cd5db575aafd9cbefe5defb96e79e1d65481f3"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
