class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.227"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.227/trebi_0.2.227_darwin_arm64.tar.gz"
      sha256 "522c18bf86e4ed715c2d1290a5d9a4e9dc6181154dbecf48ee949f9a58e01ca6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.227/trebi_0.2.227_darwin_amd64.tar.gz"
      sha256 "0ea74fd4e32595795793bf2ade55da7df378039de372e84660bcd301fb1c6a51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.227/trebi_0.2.227_linux_arm64.tar.gz"
      sha256 "60e2adf11cc93c23394824e9cc8c6f5885c84e7c38f874371b710ae9f45eefd4"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.227/trebi_0.2.227_linux_amd64.tar.gz"
      sha256 "aa317098616bbcab8427fd11530112b5f5ece7057289627cd5ba4433a740f2ec"
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
