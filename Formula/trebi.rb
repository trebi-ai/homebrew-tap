class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.232"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.232/trebi_0.2.232_darwin_arm64.tar.gz"
      sha256 "1b525dbc0b6b310b2cd244a95c180f4a60a7075c6d2675381cb696e1ed817ce0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.232/trebi_0.2.232_darwin_amd64.tar.gz"
      sha256 "dcd91c344e8d6edd7f124fac45fc084505a5c9f82d987349b975e8c8c57f7b28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.232/trebi_0.2.232_linux_arm64.tar.gz"
      sha256 "cce94f51a2b530a134ddc1188800168b6a101936b815d113ea600ab550df3a70"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.232/trebi_0.2.232_linux_amd64.tar.gz"
      sha256 "1d19a493969d7a3caa3aa8cd12d8b06e0e626a0ab073d879851d587e41f9c24e"
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
