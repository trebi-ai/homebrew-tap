class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.71"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.71/trebi_0.2.71_darwin_arm64.tar.gz"
      sha256 "1cc31a50760895917f1fad047ff8b5e18f09de9052b0821cd69b7c081832671b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.71/trebi_0.2.71_darwin_amd64.tar.gz"
      sha256 "1a252a6692c82299fa68a1dcd8e7e3d4568ce5e9022ff788efb38c277ccffc5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.71/trebi_0.2.71_linux_arm64.tar.gz"
      sha256 "f2182d221bbea69fbac24268ee953fbb3e073ae2b2848ef48ffc24839ce8e400"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.71/trebi_0.2.71_linux_amd64.tar.gz"
      sha256 "7410aaf89fa131678d17b9692582afa38a23ac5499091b647bddbd4753f9d274"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
