class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.75"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.75/trebi_0.2.75_darwin_arm64.tar.gz"
      sha256 "a57b30dff35943880b9b8d9be8761c26a19a4b2c57b39fb47b5be641d284d519"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.75/trebi_0.2.75_darwin_amd64.tar.gz"
      sha256 "41250497917e5229ab5573770298abecfa6a50b765d6998dae7e7a0b23cbeeac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.75/trebi_0.2.75_linux_arm64.tar.gz"
      sha256 "31d0db9c2389dbc4aea8603bfcee379ee0838bae67e3b71fbd49fe402f65e9a6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.75/trebi_0.2.75_linux_amd64.tar.gz"
      sha256 "6979059b8e06b8bffa6f0cbc46ed01c6df20055fc857855857582d9f3b965ddf"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
