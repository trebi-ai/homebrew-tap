class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.224"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.224/trebi_0.2.224_darwin_arm64.tar.gz"
      sha256 "5b27e71d028bc2e9f6fca2d14f860458053c96a3685983c63e34ac7f3cfd534e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.224/trebi_0.2.224_darwin_amd64.tar.gz"
      sha256 "8f53dc4fd6389e568cd0597319c62dc26870149713890d4ff50adf298e0a5fbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.224/trebi_0.2.224_linux_arm64.tar.gz"
      sha256 "e2c7f33aca3c1082033d78d20c8c9752efb9b221fddd73ff81484229620c4fe5"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.224/trebi_0.2.224_linux_amd64.tar.gz"
      sha256 "47e455de54934440febaa3737ecf243930bcc6718747858299380352be39ad9e"
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
