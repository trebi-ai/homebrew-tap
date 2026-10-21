class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.146"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.146/trebi_0.2.146_darwin_arm64.tar.gz"
      sha256 "6e46d62eb9c9450d9a7f14b6bf39f3e1f9cb1c414385fc29256739cbd6656f44"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.146/trebi_0.2.146_darwin_amd64.tar.gz"
      sha256 "78e8eff68db4ae98a6a3604ef5851bbae62a61a7b2e6fda67780effcb44228ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.146/trebi_0.2.146_linux_arm64.tar.gz"
      sha256 "d6abe805fe253aab33a576602ee3b3e314502eaf07ed64d377af56cf90d2d16c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.146/trebi_0.2.146_linux_amd64.tar.gz"
      sha256 "54b2a976a53532136b9b90618e65261b4d150631ebcc5be9acf60bcc1935ebf7"
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
