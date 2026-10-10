class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.85"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.85/trebi_0.2.85_darwin_arm64.tar.gz"
      sha256 "80f0f754aae42a6385f1abe13654551f16d328f98f7fa2190a8a1f0b110fdb8a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.85/trebi_0.2.85_darwin_amd64.tar.gz"
      sha256 "43a30576dbf2ec3c463675056a505863bbcc1b42c0019e4e387e03f27c02e406"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.85/trebi_0.2.85_linux_arm64.tar.gz"
      sha256 "1b78610587163dd8c8814da2c39128e945936e7c160ffac53da4f50fa3ba4d5e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.85/trebi_0.2.85_linux_amd64.tar.gz"
      sha256 "b1876756eeaa4509121e2b71a8a980b3f8e2f2a69ff121cfd3eb0c8dbfaec5ae"
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
