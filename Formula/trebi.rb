class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.51/trebi_0.2.51_darwin_arm64.tar.gz"
      sha256 "677500e20a1e91c7f9db3c7a6ebe5631d0d184d9e142bbeba4ceb74e2cf686d2"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.51/trebi_0.2.51_darwin_amd64.tar.gz"
      sha256 "f518b7ad97f51125dbe164302ada7796957fa364e3ff320f6d3f53f3441b1b3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.51/trebi_0.2.51_linux_arm64.tar.gz"
      sha256 "5cb5e6b806956aa40349d333074c22cc40caaf25ca61404a6a9964d660f6c5fd"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.51/trebi_0.2.51_linux_amd64.tar.gz"
      sha256 "a49857c2071d96756dfb6cb33ab26b9235e6503a8ba2cc12b99f43d7d4c787c9"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
