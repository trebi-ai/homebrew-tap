class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.236"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.236/trebi_0.2.236_darwin_arm64.tar.gz"
      sha256 "b91cc70a617e889e56a578aba6b9ac8c5f8b464d9ae43a137accf6610a7f7369"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.236/trebi_0.2.236_darwin_amd64.tar.gz"
      sha256 "20917c3a923e8fc6ece212c8543327e5a69a62f8503fd8812cccf70627d46605"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.236/trebi_0.2.236_linux_arm64.tar.gz"
      sha256 "4cae371e21733a8e20ecbc9e093fa0d244f381d8cbf3f6b0a6d4d8c107c675f3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.236/trebi_0.2.236_linux_amd64.tar.gz"
      sha256 "8742cfffc6aaebaa69123a124c38f943e2b1c052d735ffa5bd34dc4a666424b4"
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
