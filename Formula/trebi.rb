class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.22/trebi_0.2.22_darwin_arm64.tar.gz"
      sha256 "653d47f442bbea65cf4c87dc7476a612314885f1c74503ad8429fec1fccbdfac"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.22/trebi_0.2.22_darwin_amd64.tar.gz"
      sha256 "dc3ae7d4b0d0e08a70a564591e1baee94ea53bdca11ebb88273187c36ae10ef4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.22/trebi_0.2.22_linux_arm64.tar.gz"
      sha256 "252a7557064db4796dc0a94c9c9ebb7b0545c8866c97661eeec41e869ddb0a01"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.22/trebi_0.2.22_linux_amd64.tar.gz"
      sha256 "e8062e36909c2b4215b4d4adde2d442c21801d3ff30e704af2c8c5418fa64e21"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
