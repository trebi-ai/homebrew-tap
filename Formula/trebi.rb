class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.72"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.72/trebi_0.2.72_darwin_arm64.tar.gz"
      sha256 "2b3d557c2bfe7cb69af2a4666fe230f548a6f478d52e24f7226bb1acdccc0bb6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.72/trebi_0.2.72_darwin_amd64.tar.gz"
      sha256 "6b67f3d3c72b7b0e1f1b77b407795e0ca069e564f55dc489bb340ba1f00fc47a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.72/trebi_0.2.72_linux_arm64.tar.gz"
      sha256 "7aa80f09f796b9e8c3e8e97873acb0eaf5876410d1e8d0e71ce2fc1bd1eac84c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.72/trebi_0.2.72_linux_amd64.tar.gz"
      sha256 "0bb60f1f0e8fa60d5369216b591b8e24d5b7e60cc53a0937c8cdaaa41cd26c48"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
