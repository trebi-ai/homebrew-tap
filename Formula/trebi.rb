class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.42/trebi_0.2.42_darwin_arm64.tar.gz"
      sha256 "8a7c3fb11a57e0303cf696e17ae7befd9a533a27ae7009f8f6fd15d15ac450dc"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.42/trebi_0.2.42_darwin_amd64.tar.gz"
      sha256 "566700d8547be18b983fe64f7ed4f2130571cc8a9bb0e2fa8662666e04f6609c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.42/trebi_0.2.42_linux_arm64.tar.gz"
      sha256 "b10cd1f8274286f376e73c2c9fe6615ff881e206f57038a2e46dce30f8a3cce8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.42/trebi_0.2.42_linux_amd64.tar.gz"
      sha256 "9c7f29cbdb883ea783b6e0da07f922904b89a727a43454753d0563e6556a2c07"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
