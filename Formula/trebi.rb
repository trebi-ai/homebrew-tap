class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.216"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.216/trebi_0.2.216_darwin_arm64.tar.gz"
      sha256 "30d72fb09305637c05c580cb360671a9b4585bc9547804d13637355624f67247"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.216/trebi_0.2.216_darwin_amd64.tar.gz"
      sha256 "c89c535d0366a6e330901f7d29a64c31cc288972d686b9f3db69dddde50c76f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.216/trebi_0.2.216_linux_arm64.tar.gz"
      sha256 "d766f974a2f7846f08739ef1dd4941d7fcd50997daacc37e8985a22008253930"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.216/trebi_0.2.216_linux_amd64.tar.gz"
      sha256 "78fe771e8b1307d651242e6e44780e1f0479b7cfd0dfdc5205d37df8452b5095"
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
