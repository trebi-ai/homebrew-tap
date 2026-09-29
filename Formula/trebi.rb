class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.29/trebi_0.2.29_darwin_arm64.tar.gz"
      sha256 "5cc22ca827875114e7a5b708b25ce664d09368ed091c8417562a097feca2ce09"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.29/trebi_0.2.29_darwin_amd64.tar.gz"
      sha256 "c40e72e73353157acbf5075f31fa95207339224ffb21124d5d64875d93e7b595"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.29/trebi_0.2.29_linux_arm64.tar.gz"
      sha256 "3f9c17520ce4544a8903ea6de7a57d14ae11301df50326f05c83c77112230b3c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.29/trebi_0.2.29_linux_amd64.tar.gz"
      sha256 "f3712d906cd536dca47ca67d5c33950bc77da82a0c339b6e8c639064808e39c0"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
