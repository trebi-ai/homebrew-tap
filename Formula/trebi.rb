class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.175"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.175/trebi_0.2.175_darwin_arm64.tar.gz"
      sha256 "5a1dd4b5297a86184cfdc652ff03f1bcf84322b5f5413011ccdd5b47f09d9e45"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.175/trebi_0.2.175_darwin_amd64.tar.gz"
      sha256 "87f42673872c99c4942657d4e01ce9f52cbba1f03962f044d21f42561342d942"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.175/trebi_0.2.175_linux_arm64.tar.gz"
      sha256 "05444f12a081b56c68d508a3d1cd89ab5a2148931961fe97b4a35ec3300286e5"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.175/trebi_0.2.175_linux_amd64.tar.gz"
      sha256 "cbaee30681ce92459f44cb659441db1ed650e687412d2e623b0f4e40f9820e13"
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
