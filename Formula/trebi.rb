class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.119"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.119/trebi_0.2.119_darwin_arm64.tar.gz"
      sha256 "54e579c0a5b8798f24d9833f983da9ecad3d0c9dd437412ebe7ec3761fbf6a71"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.119/trebi_0.2.119_darwin_amd64.tar.gz"
      sha256 "731a3ee6284b7164e66c38ba1b2c817cdc01dc8d8e63f61ce52074d6f3b4b64a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.119/trebi_0.2.119_linux_arm64.tar.gz"
      sha256 "cc05916bbaa80c440eb13069865f17e1cdcd6ebf881e716b4da625a4c3e27919"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.119/trebi_0.2.119_linux_amd64.tar.gz"
      sha256 "4737e4011deafb951f8557c073102d795bd524ac1fe11a0febb5a7a1837567fb"
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
