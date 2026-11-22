class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.238"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.238/trebi_0.2.238_darwin_arm64.tar.gz"
      sha256 "df0fd540c100eaad6bdc249be1183ff703290f44db601df74db9a58cd9527bf6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.238/trebi_0.2.238_darwin_amd64.tar.gz"
      sha256 "e144f74e058cc5e0876f9a50cb602dfa5da66b2e69891957d2e9403f5494d0ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.238/trebi_0.2.238_linux_arm64.tar.gz"
      sha256 "2a4384aa09244107f35fe7d80d271f178669fea1a02c318b5d2f2c07848248be"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.238/trebi_0.2.238_linux_amd64.tar.gz"
      sha256 "dc9835359aaf148c78454e8f7f756b714b97c78e796f61708dd3447f42bd5d70"
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
