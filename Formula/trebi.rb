class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.78"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.78/trebi_0.2.78_darwin_arm64.tar.gz"
      sha256 "47206f0c23442ddfd878757d2b82a3cde119a13d3a468f9f436c3c45634e3b24"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.78/trebi_0.2.78_darwin_amd64.tar.gz"
      sha256 "63c11049328f396e66d5457fcbd40ce57e402e10e3239a12d7f6c27d5a1d22d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.78/trebi_0.2.78_linux_arm64.tar.gz"
      sha256 "d3007cb8a48d9fa18f2d9b357caf09e1a116a341ef350b63700377eb6e6825a4"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.78/trebi_0.2.78_linux_amd64.tar.gz"
      sha256 "5aaa998feeb68456c13821d296f8e1c63117566dca746f650a50ad67a5695efd"
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
