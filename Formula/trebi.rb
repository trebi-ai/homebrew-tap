class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.33/trebi_0.2.33_darwin_arm64.tar.gz"
      sha256 "16b9f022f05ffe0810f719ba7feb87624651c906f521b487b157e3300cf9d405"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.33/trebi_0.2.33_darwin_amd64.tar.gz"
      sha256 "37e26a3b64c8c6b391c5902e78f8561fc71bf634c3a71b36ce8f45374037d658"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.33/trebi_0.2.33_linux_arm64.tar.gz"
      sha256 "978749987fe61544a94d305009b6f8475a7665388b8d72d9ede8e905c8d1aaac"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.33/trebi_0.2.33_linux_amd64.tar.gz"
      sha256 "205881ba3ccc63706e3b1c2eab7743b392b859d9c6aa131ef59972b1f14ba8bd"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
