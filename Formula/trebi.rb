class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.101"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.101/trebi_0.2.101_darwin_arm64.tar.gz"
      sha256 "01b56a7d052517955d42d94cb97acb03ded3c9c8ea908a8200a431b7ad8d7545"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.101/trebi_0.2.101_darwin_amd64.tar.gz"
      sha256 "1dc07ec95393dcb7003cb776f79e49bbbe4e085a1eee67286fb4406f2a7c1a84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.101/trebi_0.2.101_linux_arm64.tar.gz"
      sha256 "7ed663c69303c45e9adaf83c6b3f5f1cdaaee8527625a7655208cf4f260adf99"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.101/trebi_0.2.101_linux_amd64.tar.gz"
      sha256 "52fd86d5df16e1c2a2b54e764e3756c830046e2d0b06919ad0122b1a5a37d314"
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
