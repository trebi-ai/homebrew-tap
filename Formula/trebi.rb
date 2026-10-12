class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.106"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.106/trebi_0.2.106_darwin_arm64.tar.gz"
      sha256 "66d0956d7a0a20a7e1d40bad0c915851404758956a89f785b4766b37d5be4597"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.106/trebi_0.2.106_darwin_amd64.tar.gz"
      sha256 "20e4efc153a6a3e518a15a3fc647e14615a5d1ca662b98b4309d942c3e0677af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.106/trebi_0.2.106_linux_arm64.tar.gz"
      sha256 "bae17e40987d2484225ca100a2bb4c4b6f1104f62704388e29de93ffaedb1df6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.106/trebi_0.2.106_linux_amd64.tar.gz"
      sha256 "a1cc83d8ecf100444de4db78530dc9853a090903525b0f5dc104ec9de35b885d"
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
