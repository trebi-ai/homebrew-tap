class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.37/trebi_0.2.37_darwin_arm64.tar.gz"
      sha256 "ad479002ee2cc07d072cb850c8fb61374f7e9206d06683994a54b95d2978b632"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.37/trebi_0.2.37_darwin_amd64.tar.gz"
      sha256 "841f05d87ef5c07de44eae4eeef8af942220c011cf77ad65efaa2535ccde3d0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.37/trebi_0.2.37_linux_arm64.tar.gz"
      sha256 "1a0e70e3d44c88f76b0278778291b2b05e11d8ac972f599c7d1ede1a685de4d0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.37/trebi_0.2.37_linux_amd64.tar.gz"
      sha256 "56ff2dd0363969594360ace0d5748707fa5792c4c221d5493dbae93ddaeffb08"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
