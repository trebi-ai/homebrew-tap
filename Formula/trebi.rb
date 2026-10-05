class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.54"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.54/trebi_0.2.54_darwin_arm64.tar.gz"
      sha256 "55f2af08345a25d0f522c08a1f3aa8702227b28d754f2891c98de5df911a4b8d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.54/trebi_0.2.54_darwin_amd64.tar.gz"
      sha256 "2099c84fc130431b09524a3f947c75d33f6746f0f1467c39067636822f7dec4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.54/trebi_0.2.54_linux_arm64.tar.gz"
      sha256 "1513ff5b826beaede57b3a3cda739aaaf37a631358f72828dd8a157132839c3a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.54/trebi_0.2.54_linux_amd64.tar.gz"
      sha256 "cda265bd753da07b3da19b03561f16b5fda23190089d1fbabf649d5c76f6cfdb"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
