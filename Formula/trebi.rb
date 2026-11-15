class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.217"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.217/trebi_0.2.217_darwin_arm64.tar.gz"
      sha256 "d06ea1eb5da9e990bb24077c851793523fac0f13329c235eb4b31a985aa20e2e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.217/trebi_0.2.217_darwin_amd64.tar.gz"
      sha256 "1a9e4ebe35cd5c87fe6d8ceca40f655fe5bff91f5887b65d155e7787a1259571"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.217/trebi_0.2.217_linux_arm64.tar.gz"
      sha256 "10b18d7f452ea3ae757d05b922792fdb78b598e9d171cd34d984e6cc2269c0c8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.217/trebi_0.2.217_linux_amd64.tar.gz"
      sha256 "72aa70df78f9488e5042808a79a85aa86002232a3ac4921c7abf0ce8058bf572"
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
