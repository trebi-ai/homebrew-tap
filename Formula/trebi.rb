class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.25/trebi_0.2.25_darwin_arm64.tar.gz"
      sha256 "f8534420084a200fd6d458c0a20397e525e2214f9714ae9765cb1490a7960620"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.25/trebi_0.2.25_darwin_amd64.tar.gz"
      sha256 "6cca9a4742b8ff35c52149787c0eb1373b684d1a2b72c2098b9a87500b285ce0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.25/trebi_0.2.25_linux_arm64.tar.gz"
      sha256 "ff76c9638d4b9ee343c034c8f7f250f92d8a9f721afcf4cddfee85b2e6f2fd93"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.25/trebi_0.2.25_linux_amd64.tar.gz"
      sha256 "b5900f735d0b94aeea8ee2c0cd8007a55debb73754aad12d5f36c9bd0bd3179d"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
