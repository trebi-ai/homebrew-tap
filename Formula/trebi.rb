class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.56/trebi_0.2.56_darwin_arm64.tar.gz"
      sha256 "395ae59b56f7598fabbf22dddf83c2a4bc349545658941fd0f98f42aba2f1411"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.56/trebi_0.2.56_darwin_amd64.tar.gz"
      sha256 "cc38befadefb527c53b5f957191af41a79b1c63fbff3383f4a046acb7a5cf07f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.56/trebi_0.2.56_linux_arm64.tar.gz"
      sha256 "67fc8cdd13d42c222bc7b98408c31949439a5a14cb880f3766210796e3a0ed2d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.56/trebi_0.2.56_linux_amd64.tar.gz"
      sha256 "d70138dd4c8b8c3fe375c1aad468cbbd1084aebdd12415187f31a9e879675f87"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
