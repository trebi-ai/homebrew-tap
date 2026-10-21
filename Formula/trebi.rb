class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.143"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.143/trebi_0.2.143_darwin_arm64.tar.gz"
      sha256 "637e9849a20ea7047fe3738169cbc17fb3b0cf88cc4b3d9765abb29a1357368d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.143/trebi_0.2.143_darwin_amd64.tar.gz"
      sha256 "3d7a5c13b5e50673bfb48ccdbee27b62362fbb9a78832c8605b5e9e78d704357"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.143/trebi_0.2.143_linux_arm64.tar.gz"
      sha256 "519aef0097910b323736f6ca0f45766c3e18f152c1d598ce24e5c16b712766ff"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.143/trebi_0.2.143_linux_amd64.tar.gz"
      sha256 "299279913ca68013b1381772f3afc753859bd58efad3688c2e799855e7c8fdb7"
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
