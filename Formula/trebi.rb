class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.197"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.197/trebi_0.2.197_darwin_arm64.tar.gz"
      sha256 "adac342fa656e875ff6f03fe03e33e3c7c22a487936267c6b8a2e4ce7d4da461"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.197/trebi_0.2.197_darwin_amd64.tar.gz"
      sha256 "8c444799b87888357252f5434b200aac96c7c8a01e25447e09be6e7d7730539e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.197/trebi_0.2.197_linux_arm64.tar.gz"
      sha256 "c17f597ccdbbf798fa7d37b2f84c4207e9e233b65ee4340af342942f79693d10"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.197/trebi_0.2.197_linux_amd64.tar.gz"
      sha256 "c1a346685114c6af90c5ae5993533d070318331e2febad73c77f5747b677e7ec"
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
