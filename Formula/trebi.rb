class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.167"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.167/trebi_0.2.167_darwin_arm64.tar.gz"
      sha256 "dc45f81bfeb5366e703c3283079ca546934d70daa4f5a13e6dd800b37ecf9b64"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.167/trebi_0.2.167_darwin_amd64.tar.gz"
      sha256 "10ce998b2658fdd652bb1fbb2646545d9d732566539fdadea56b23e54a3406f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.167/trebi_0.2.167_linux_arm64.tar.gz"
      sha256 "1fcee7fef0b754f3eb20c474ce66c19a3fc5ac9fc5fb5d0d6b729e9928cf8b14"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.167/trebi_0.2.167_linux_amd64.tar.gz"
      sha256 "1086d728eef13448d3c2dcf17d711558619e1a3e9464598d473441d025e3343e"
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
