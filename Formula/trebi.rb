class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.144"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.144/trebi_0.2.144_darwin_arm64.tar.gz"
      sha256 "9592881d9f436f0e37d78144100c6793c6f4f8f2b53e295519b6e0a73bc9494b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.144/trebi_0.2.144_darwin_amd64.tar.gz"
      sha256 "ad9896f8d2529bd43c442ef8f237d76abf7dfd4881301df022d9c7fe20561cfa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.144/trebi_0.2.144_linux_arm64.tar.gz"
      sha256 "20d5475b4ec01d0030526ac3d7e5bfabd9ea7fcffbe0dbcea1630a1326e54b81"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.144/trebi_0.2.144_linux_amd64.tar.gz"
      sha256 "633aa9ed7ce95a8fb6f989f7b46bfaaa57bbc100a20f42e90736a5b7c6a54efb"
    end
  end

  def install
    if OS.mac?
      prefix.install "Trebi.app"
      bin.install_symlink prefix/"Trebi.app/Contents/MacOS/trebi"
    else
      bin.install "trebi"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
