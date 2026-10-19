class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.134"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.134/trebi_0.2.134_darwin_arm64.tar.gz"
      sha256 "c83ba5b13c795cefe1a7b46ef82ed32b0dc05fe50eb53302725b7201a8834129"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.134/trebi_0.2.134_darwin_amd64.tar.gz"
      sha256 "1196036e20a8be8bf22603eb50b34e3dbe98baa3f96e6b0a7b910c131363a4ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.134/trebi_0.2.134_linux_arm64.tar.gz"
      sha256 "baff524ba297d0f7c53d23286ce66f70e83f092c809b5753e96c559b31300851"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.134/trebi_0.2.134_linux_amd64.tar.gz"
      sha256 "7da26393de895043101cc4d1b8966569fa5fec22f11d159dc8db4adfea08b827"
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
