class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.180"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.180/trebi_0.2.180_darwin_arm64.tar.gz"
      sha256 "ebd2df9a2f1f1677351cd49b765c4e628a4d3a04c465ef6e6b104fc99f1eacd3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.180/trebi_0.2.180_darwin_amd64.tar.gz"
      sha256 "eff5d640aa45956f1a949c75dc909384d22afc2023a62a990aa6793c0d999cc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.180/trebi_0.2.180_linux_arm64.tar.gz"
      sha256 "78ebce8d4a752ac902dac06e2509a40cf485fd1604ef872a6566fd2517113126"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.180/trebi_0.2.180_linux_amd64.tar.gz"
      sha256 "b936f5de9cb984ac71ab5e09bb54c075ca90c9aca46a0559308b059cd2b211a5"
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
