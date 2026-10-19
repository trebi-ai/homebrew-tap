class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.136"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.136/trebi_0.2.136_darwin_arm64.tar.gz"
      sha256 "657a8513f2596511fcb8e4881549681640d698060edbce9e0bb69e82762872a7"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.136/trebi_0.2.136_darwin_amd64.tar.gz"
      sha256 "12385498a0fe2602864b47fee526478260ec48f4013254ee3da4e77e9a9ce69a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.136/trebi_0.2.136_linux_arm64.tar.gz"
      sha256 "222eb62f25936bd1d38194b49ea300ad75d5776ed011e62832137a2b07c02e12"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.136/trebi_0.2.136_linux_amd64.tar.gz"
      sha256 "82e890bd3b63cdc5f59f2e6cdf0d2c42d9de8255296f7039c3f6e02db07ef60a"
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
