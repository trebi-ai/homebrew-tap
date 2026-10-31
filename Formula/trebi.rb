class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.172"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.172/trebi_0.2.172_darwin_arm64.tar.gz"
      sha256 "ab8d35eec14727ec69cec025c3a9e7e9ca39ba641dd1af28a9f4a7ce3e5bf838"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.172/trebi_0.2.172_darwin_amd64.tar.gz"
      sha256 "59564c836e0cc1af6a4e0fdb9f46f2869c6ee85afd31cdc0537d3574da033051"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.172/trebi_0.2.172_linux_arm64.tar.gz"
      sha256 "b49b0af0649424cafad15d767177d95958e6a1d309f3c92ad333fa59046a7cbd"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.172/trebi_0.2.172_linux_amd64.tar.gz"
      sha256 "6017e051c364e1b6a9689095134c2b450f0144cd2184400b0d0558d71bf1b296"
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
