class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.159"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.159/trebi_0.2.159_darwin_arm64.tar.gz"
      sha256 "53705996ea4842fa0a900acaf541be583e6b0e1fdae7c7f1be29bd78cc6f8649"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.159/trebi_0.2.159_darwin_amd64.tar.gz"
      sha256 "02c79b62c928a63f6881976a3e9f5fac5b6a7ccc052ed20c7ab4272d6e67bb35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.159/trebi_0.2.159_linux_arm64.tar.gz"
      sha256 "4c9f4e1bf615040b76a548d60e0aa2ce517b5363df56905a26aa6264e257bfc9"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.159/trebi_0.2.159_linux_amd64.tar.gz"
      sha256 "09f4cb96a841482eaea4a8e1187cfa65e9dbae76eb5a756c973003848491ab63"
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
