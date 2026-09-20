class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.9/trebi_0.2.9_darwin_arm64.tar.gz"
      sha256 "c4248af2635338616ae85e9084633c8f6a365e66caba6b399b64abe65f3c2be1"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.9/trebi_0.2.9_darwin_amd64.tar.gz"
      sha256 "71c651cccd074994f85078769f5c565170365f43c891d102092f53fc79975cff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.9/trebi_0.2.9_linux_arm64.tar.gz"
      sha256 "eeeaab1eff4323e7d256aa55af9167f4ea270f899f8eba021943f74e5fcd649b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.9/trebi_0.2.9_linux_amd64.tar.gz"
      sha256 "77c1c7b19d1df74eb6d1ed75859b30732798d194432124720415755f9bd6e227"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
