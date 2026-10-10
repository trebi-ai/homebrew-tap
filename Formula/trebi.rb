class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.87"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.87/trebi_0.2.87_darwin_arm64.tar.gz"
      sha256 "d2ee0db0e39978f12ba5a069c13ed377f53ac604747d7e5f7386671e34a094b7"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.87/trebi_0.2.87_darwin_amd64.tar.gz"
      sha256 "8ee899ecc89eda10d1b32598d45428e0390b59ad4bf27ba2703526db560f282a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.87/trebi_0.2.87_linux_arm64.tar.gz"
      sha256 "07caf433e1f0f7caf8ae8ad5f8df30b013e134ef53dbcf3ba2dc547a4194d137"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.87/trebi_0.2.87_linux_amd64.tar.gz"
      sha256 "0637d9c7fd6e26869d231a5f46a8eb0e304e076132ed02bc5508f6136fd51f8b"
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
