class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.207"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.207/trebi_0.2.207_darwin_arm64.tar.gz"
      sha256 "66015f83a16ecb5c8730fd62f4d3c475070f54671a8872c703124a0f3b59a6fd"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.207/trebi_0.2.207_darwin_amd64.tar.gz"
      sha256 "223d3c12d69d86a55c72b88b45e69ddc7b6635086f4b82bb3995308c13287907"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.207/trebi_0.2.207_linux_arm64.tar.gz"
      sha256 "41651ab1d9f97bc81e718a7f0ea9ef556d76e0f1352b53a04b75f0717cbc1026"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.207/trebi_0.2.207_linux_amd64.tar.gz"
      sha256 "6c00ff29d97adb46347a262b307ca24b183693941249ebdcee2c17e0104f26c6"
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
