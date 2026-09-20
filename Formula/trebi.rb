class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.5/trebi_0.2.5_darwin_arm64.tar.gz"
      sha256 "69472d583b1fa4cbd0c61d2c347e9ac6f2ce282f179d7a17e68fa56db910c38b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.5/trebi_0.2.5_darwin_amd64.tar.gz"
      sha256 "1147738b84f8be16088be0a3452421d742adc56265db0ecdc03b32c75a1faa26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.5/trebi_0.2.5_linux_arm64.tar.gz"
      sha256 "6b4c1951226970f3af441f35d82c449f5338cf6a067feeabd5c05d5f8463e534"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.5/trebi_0.2.5_linux_amd64.tar.gz"
      sha256 "e78c0d3e35602d38f2fa0b4cbb8795bb0d7cb1a68ad37a8a7485a531109d9d4c"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
