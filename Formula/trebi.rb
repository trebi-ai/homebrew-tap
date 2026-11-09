class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.200"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.200/trebi_0.2.200_darwin_arm64.tar.gz"
      sha256 "702b77e3f9c1bf55a3ac7b16a51bc79c7f16f367891f481ba78e8809482e7215"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.200/trebi_0.2.200_darwin_amd64.tar.gz"
      sha256 "374f33dd01bf0f537b9b5f411f27062729f40df9fa092966b4461196dfa28f43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.200/trebi_0.2.200_linux_arm64.tar.gz"
      sha256 "45ef853dff1fc438771f7ce4ba874ffed4d7aa8ece1d54ea74402a119a1134a8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.200/trebi_0.2.200_linux_amd64.tar.gz"
      sha256 "b43cd891a548ceac70b4424c0aa4afdfa0d09aacc7b80177c8f630bfe09b5062"
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
