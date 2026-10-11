class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.98"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.98/trebi_0.2.98_darwin_arm64.tar.gz"
      sha256 "10a3e93ec5fefee985cf66ca7d5c866f6eeb1cd6756059a79824b36a1cc64cb7"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.98/trebi_0.2.98_darwin_amd64.tar.gz"
      sha256 "d8b83c891e5a311d558d694d76e7012d83bef425814b318031ff5b66ad9568ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.98/trebi_0.2.98_linux_arm64.tar.gz"
      sha256 "d2b3c55c6fe741167fa48360b78630ba2b652ff3a99eada6ef633fbccb19e507"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.98/trebi_0.2.98_linux_amd64.tar.gz"
      sha256 "14bf345cc2c19197f8d53c5c4ede29c2f93d537074cfc6605ace82fdf7c051b3"
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
