class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.147"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.147/trebi_0.2.147_darwin_arm64.tar.gz"
      sha256 "e94c706bb5ae5855c89974f9b24d8e73f37d83ba5912885bd32a1dd0eae5f625"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.147/trebi_0.2.147_darwin_amd64.tar.gz"
      sha256 "76493ade1e3453d87c891f0fbf432a18ccf0f342261e27518cae9b4dedbe05d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.147/trebi_0.2.147_linux_arm64.tar.gz"
      sha256 "eee5e36e36dbc764ddae01dacfd78f999889d71811f2b8afc1a872067194349c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.147/trebi_0.2.147_linux_amd64.tar.gz"
      sha256 "43ae85da1ff23dcbd40dc2be76c3eb7edb243bcd87a7bed50383ab1356c1bab9"
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
