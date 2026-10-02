class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.46/trebi_0.2.46_darwin_arm64.tar.gz"
      sha256 "98706342eeeea65cbda530d2ad606844c812dee75786fb5c8a0ee64d90aada58"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.46/trebi_0.2.46_darwin_amd64.tar.gz"
      sha256 "bd5bae6e91aaa463dee911852e35f890b05dffea481bfbf6adfa482890394506"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.46/trebi_0.2.46_linux_arm64.tar.gz"
      sha256 "f255bff80dbb6294b89eb7350eb36ec3a0c4c641ec1395f82874bec4ea53c66b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.46/trebi_0.2.46_linux_amd64.tar.gz"
      sha256 "2cc89ae6dbb264ad9eaeef4df7ebc48dc171f4df496104248e653dc7e9a26fbd"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
