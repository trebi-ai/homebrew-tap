class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.140"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.140/trebi_0.2.140_darwin_arm64.tar.gz"
      sha256 "3ea35efad47f67e3c70f2f5922941144100aeacd7e00e580fe5e445d6d993726"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.140/trebi_0.2.140_darwin_amd64.tar.gz"
      sha256 "e37f913c6763b6b89c9a1960bb3686cbc960ffbbb1926c39802c15ce3b5ee979"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.140/trebi_0.2.140_linux_arm64.tar.gz"
      sha256 "336b5068c83a6d1b65bcff999e5d6ea5fad55b0c577258a920ee2a5ed3400ec3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.140/trebi_0.2.140_linux_amd64.tar.gz"
      sha256 "0cdc23e6c91891a98d644df5269eb86ec36970dfc375b0925f1234fef03df3ec"
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
