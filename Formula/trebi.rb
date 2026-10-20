class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.138"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.138/trebi_0.2.138_darwin_arm64.tar.gz"
      sha256 "3bf6a6ca2a21e455bb1107fa7cf74b5b32742d1995b157b226bf6fcf144fe794"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.138/trebi_0.2.138_darwin_amd64.tar.gz"
      sha256 "b709ca82ce1370a0ffcb109c46a68a2e3ee5ae23e28e29f6c4a84d3039d7e84a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.138/trebi_0.2.138_linux_arm64.tar.gz"
      sha256 "8f0251db582dc848ef3ac11049b545e93ec1f5a12a64bbf6a343ca82860adb4b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.138/trebi_0.2.138_linux_amd64.tar.gz"
      sha256 "7293178c3800d355fbc0ed477e2ae82a1b27eea76159574fed9f42e9695aa708"
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
