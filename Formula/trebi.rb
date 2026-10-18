class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.130"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.130/trebi_0.2.130_darwin_arm64.tar.gz"
      sha256 "9b7bf0b46063a67ad397b76ccb3845e668cfcd1fab2c67f81bac6239a4fd7690"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.130/trebi_0.2.130_darwin_amd64.tar.gz"
      sha256 "3b40bab4b2ae05f48348212d2239ff63f803794849c93b6a36ba8369f2efc396"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.130/trebi_0.2.130_linux_arm64.tar.gz"
      sha256 "015eb723fe33b5b266623d0adc36e33d4e6500415a1966dd5b9c4c30412005f8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.130/trebi_0.2.130_linux_amd64.tar.gz"
      sha256 "af77a3e93fe8f34170b9fd95044dd97d5d3025686303d2eb256fed62530a9470"
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
