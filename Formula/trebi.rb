class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.74"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.74/trebi_0.2.74_darwin_arm64.tar.gz"
      sha256 "fdeeeafc466ab22d63b193c250beccd4a4ad77151ff9c09ce5a41ab2e1d0632f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.74/trebi_0.2.74_darwin_amd64.tar.gz"
      sha256 "84225886408a34efbf727396da18bcfcb11c3cdbe08a230b70b497d68f6a3a09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.74/trebi_0.2.74_linux_arm64.tar.gz"
      sha256 "7838d6d71e629048934c847775269a77c85b0f3a85bf1860e2f268bf934ebed2"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.74/trebi_0.2.74_linux_amd64.tar.gz"
      sha256 "abdb7ce39a828c5293ad2788368629973ff4390c31a87271cbcd7a28ce613a48"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
