class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.205"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.205/trebi_0.2.205_darwin_arm64.tar.gz"
      sha256 "595ba908cb762ab2a13fb58d6ca541a8795e4b747fa49a49e6d67f3bac014b39"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.205/trebi_0.2.205_darwin_amd64.tar.gz"
      sha256 "bfcf27857ba1714a9b76b0f9002e7e441477496ebafb123651e1ceae9dcdcc79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.205/trebi_0.2.205_linux_arm64.tar.gz"
      sha256 "3a9f78fc2fe9293a77f3afddc0f63b89cf647f226b80b4386d45241d2dff2170"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.205/trebi_0.2.205_linux_amd64.tar.gz"
      sha256 "dc97dddc10d58b71701a2fca0d02c7653444d682d20e4e87ee3bd984144f630e"
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
