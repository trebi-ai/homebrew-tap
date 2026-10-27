class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.158"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.158/trebi_0.2.158_darwin_arm64.tar.gz"
      sha256 "6b81d45e51639437f0de9b06f6873d67a132e5367c7f2843ac45d7deeb213500"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.158/trebi_0.2.158_darwin_amd64.tar.gz"
      sha256 "189aaadca37c61aec3fac8c2a8f70fb2d7a6e8d51dac57dcaf0fd42526a56749"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.158/trebi_0.2.158_linux_arm64.tar.gz"
      sha256 "4fda31856b56af14be452a86b93f64742bb9eb263f81e1ca02974fad48f8192c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.158/trebi_0.2.158_linux_amd64.tar.gz"
      sha256 "4fe9af316d2c3caf7c6f55e21e88ad1725647195ebd89920460362faf6b59a05"
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
