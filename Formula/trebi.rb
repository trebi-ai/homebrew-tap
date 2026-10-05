class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.55/trebi_0.2.55_darwin_arm64.tar.gz"
      sha256 "414331f5ef666a895211051d83721cccec6bb96e2da94c4ba180df1625f43abc"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.55/trebi_0.2.55_darwin_amd64.tar.gz"
      sha256 "1e1a5a218ac50f91d5507bfe93b9ce42d9a0d70d484e683400e4432fc0504ab2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.55/trebi_0.2.55_linux_arm64.tar.gz"
      sha256 "5b42e2d97baf90c2e697e71b976a216cc7fe9c80c5a8845b83c4c119071ee899"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.55/trebi_0.2.55_linux_amd64.tar.gz"
      sha256 "1faec4bc3be933905b05c7055c9a6e99f0cd155f384c47774329b1b86e6b666f"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
