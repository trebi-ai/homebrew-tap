class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.45/trebi_0.2.45_darwin_arm64.tar.gz"
      sha256 "8ad947f63cb0d45bef3d2308975627d6ef2aac7fd7017eb46ad1488ebcdf261b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.45/trebi_0.2.45_darwin_amd64.tar.gz"
      sha256 "18bddd6589291577ebeadc0870bd10235d46af437ba04eec97fd00d12e74276e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.45/trebi_0.2.45_linux_arm64.tar.gz"
      sha256 "62a128be6ba06aed3c8cac8e66938e54d4d9cadb5cfe50878d81190316545f68"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.45/trebi_0.2.45_linux_amd64.tar.gz"
      sha256 "cbde73a56d9789e8d9d98dba9e847e9f6bd08df86adf8131ac5045d4cbcd3268"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
