class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.73"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.73/trebi_0.2.73_darwin_arm64.tar.gz"
      sha256 "b8ada235cef5c3e4e9ff2b86403d13a325614ec27b3d8fb621a5ddd6b6560976"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.73/trebi_0.2.73_darwin_amd64.tar.gz"
      sha256 "f60ca21edacc57d544e4a2fac9981da637c19aa70ac5f529855d4de93d7a49e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.73/trebi_0.2.73_linux_arm64.tar.gz"
      sha256 "681e9e11e551dd8b1ab7bac22e9af2259f1359225883b141b9c00fed2391cd2d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.73/trebi_0.2.73_linux_amd64.tar.gz"
      sha256 "f3f450447a8494f84fdf2dd2ffbf54c1463bf7547e50b54337541a99e2d5c078"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
