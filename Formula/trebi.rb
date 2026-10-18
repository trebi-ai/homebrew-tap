class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.132"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.132/trebi_0.2.132_darwin_arm64.tar.gz"
      sha256 "9c6c8b53a49d22a84731e1967bdd1bb52022eea02118360d3f81262829d9b67b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.132/trebi_0.2.132_darwin_amd64.tar.gz"
      sha256 "a422f759a67e54bd6eb24c58f6c4f468351644f1bc0cfe337406d58acda8eab9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.132/trebi_0.2.132_linux_arm64.tar.gz"
      sha256 "dda2878a0192121da7ca887439624e8828bad717b49a5c41baf2b7503c996475"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.132/trebi_0.2.132_linux_amd64.tar.gz"
      sha256 "e6052c30c67f40fffefa703f11c4129b790f4edc8dda3542ee1be1154f8a25b7"
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
