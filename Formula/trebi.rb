class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.59/trebi_0.2.59_darwin_arm64.tar.gz"
      sha256 "740cdebb67984a77be8f0ff8198045d48b9d762e6338b8e4608976e7418eb265"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.59/trebi_0.2.59_darwin_amd64.tar.gz"
      sha256 "c1b5fc0cff3e929e53745e8175cded36a82b03e0d446fd83c1b48daa39e888e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.59/trebi_0.2.59_linux_arm64.tar.gz"
      sha256 "fc27a1fb647b3fda77af8591192bac13c2b924faca1f917bbf010fbb1bf3c36d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.59/trebi_0.2.59_linux_amd64.tar.gz"
      sha256 "09e0401e328f3072881df9f1e873fa9acae1d49cc800d9ed094d0eda3f426b94"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
