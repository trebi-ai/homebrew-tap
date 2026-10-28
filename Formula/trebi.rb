class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.160"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.160/trebi_0.2.160_darwin_arm64.tar.gz"
      sha256 "9d21ecb6cc0ace6c20c533e3e808da821685a3db3fc1c8eedaf5038dbb1a1df7"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.160/trebi_0.2.160_darwin_amd64.tar.gz"
      sha256 "6a8cb6572d78eb409fc78b212fbc38e34fc17c6a4d5dcd48a03f9e60940c0c3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.160/trebi_0.2.160_linux_arm64.tar.gz"
      sha256 "d865034c2b05436a116907adcb2f41886f85247df90a80857a40ed1aa92725b3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.160/trebi_0.2.160_linux_amd64.tar.gz"
      sha256 "0d74f422b4f24d49bff41ed13df0cd94259ebe5d3fffcd325c9ed873e01c9dad"
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
