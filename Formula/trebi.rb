class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.96"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.96/trebi_0.2.96_darwin_arm64.tar.gz"
      sha256 "27aa3c6385a7ebe4b94ad2119cd3668b8bd195f45fbcb148c39da42dbe172913"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.96/trebi_0.2.96_darwin_amd64.tar.gz"
      sha256 "68b3e66e8eecae741e498e1e27977299049239ea586b3fb121ab76eaa39eaccc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.96/trebi_0.2.96_linux_arm64.tar.gz"
      sha256 "9273a2d797a3615b3fa1293d9bd5b248a35234fbf492e834c2c6222a355eec4f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.96/trebi_0.2.96_linux_amd64.tar.gz"
      sha256 "3a4acf3da0b2df21f1596fea19ae04162d8a4ba2649063473d9f93f317d92cff"
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
