class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.123"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.123/trebi_0.2.123_darwin_arm64.tar.gz"
      sha256 "981b7b6f58964dfd679326c1c179e9a6ddb9c3466357770979752775d7fcd82a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.123/trebi_0.2.123_darwin_amd64.tar.gz"
      sha256 "007961a354e55e18801bca6112fa0230b8a5f0d0749a9f2dc7e1c9b425e88b78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.123/trebi_0.2.123_linux_arm64.tar.gz"
      sha256 "13034f5e5b7783dcb36f5f85538650033d70ecc8075f3ef5fa4334b9081ac5a9"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.123/trebi_0.2.123_linux_amd64.tar.gz"
      sha256 "ed3c40ddd7fc47f2864e4daa7b04eff024b72ae99acf58970c72a7a85b78c72c"
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
