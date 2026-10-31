class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.170"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.170/trebi_0.2.170_darwin_arm64.tar.gz"
      sha256 "329a309fc664499d035ab2d88ccc6ba0c0c41f073fcb80f258eb613a0a7a9627"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.170/trebi_0.2.170_darwin_amd64.tar.gz"
      sha256 "fa102871a3e3e3d368514bc4b440223d4a39c49cc1871fca308be82eb2d2bc16"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.170/trebi_0.2.170_linux_arm64.tar.gz"
      sha256 "f71d2407b16f9eada58959eade7bdc1f691087d12352fae2cb92914444bf8fc7"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.170/trebi_0.2.170_linux_amd64.tar.gz"
      sha256 "5f2f3576ee33ccebffde6578d858b55ad3a76b65fa2e59f6e135050b65f4cb02"
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
