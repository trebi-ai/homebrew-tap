class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.57/trebi_0.2.57_darwin_arm64.tar.gz"
      sha256 "4197ab4e8e00beef862a26fd1e58d5365c825fe62435ff75e47ab3b92e7b855d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.57/trebi_0.2.57_darwin_amd64.tar.gz"
      sha256 "dcc690d04f69d62474ad5d4449fe1d27b75a3e4924ab1524197c80004a3d17fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.57/trebi_0.2.57_linux_arm64.tar.gz"
      sha256 "bc1d632c7713e3782551f2a01c44b27dbe7668ce6ff8efd930fd3bdab9921b89"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.57/trebi_0.2.57_linux_amd64.tar.gz"
      sha256 "ca75bf0b3bccf672e72a589842a18cd6b7b2480a5e27a6a1f340b1d676b813d1"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
