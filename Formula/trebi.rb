class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.150"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.150/trebi_0.2.150_darwin_arm64.tar.gz"
      sha256 "3e1bffb28b9fb75845b507429f9321fbda67d867804eaf93969957b1cc79595b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.150/trebi_0.2.150_darwin_amd64.tar.gz"
      sha256 "0b3fd8c87fc27393321ccb9031b801f7ea0d0176dcf6a95b881d3ef37497d044"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.150/trebi_0.2.150_linux_arm64.tar.gz"
      sha256 "a9720dc3df89ec66c40ca1d2da3cbbf98d0b315ba3d064f9e17940ed62a98355"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.150/trebi_0.2.150_linux_amd64.tar.gz"
      sha256 "a41a6ae987ce176f545bc34d065916d72054384a902c59552f3c076096299b1e"
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
