class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.113"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.113/trebi_0.2.113_darwin_arm64.tar.gz"
      sha256 "4c9d3faf9c7b387b243f8db391fb510b4a8f690bcee78a350e78fc986fd197a8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.113/trebi_0.2.113_darwin_amd64.tar.gz"
      sha256 "231189bf23517437698afab322209735ceea938f02510c9ca1ab9be0db750e5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.113/trebi_0.2.113_linux_arm64.tar.gz"
      sha256 "da1081112c963695a261ba33377129b5c114cd873043cf38a4527ddb5a5177a6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.113/trebi_0.2.113_linux_amd64.tar.gz"
      sha256 "56ed4da1388eb7457ecde454d67b884356984bce29712af2501ed5136b655c6a"
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
