class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.67"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.67/trebi_0.2.67_darwin_arm64.tar.gz"
      sha256 "0ac075ef5631e0ba3009e343c6f8306a33107648341c0a8039b5540388506aac"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.67/trebi_0.2.67_darwin_amd64.tar.gz"
      sha256 "1d02f767466710871b1d768a8353fbb7325352ae2c2c5a4192eebfab06154a2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.67/trebi_0.2.67_linux_arm64.tar.gz"
      sha256 "ba8dac5ba55bbed21826aae2c955c907b386634987b1e19405d0bf67fbb9e5d4"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.67/trebi_0.2.67_linux_amd64.tar.gz"
      sha256 "b50a57f6b99fb9f8585d06830103cc07bec98365a99507892891f476a05beadf"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
