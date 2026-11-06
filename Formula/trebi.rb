class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.186"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.186/trebi_0.2.186_darwin_arm64.tar.gz"
      sha256 "874a49a26cad89cb308a134dd214c7d58ee7a64b69846deb79e7258e85a5b308"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.186/trebi_0.2.186_darwin_amd64.tar.gz"
      sha256 "d481182578553f436ccfe9a952a5d7ebe8b3f657266a509fef35ed27816a25ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.186/trebi_0.2.186_linux_arm64.tar.gz"
      sha256 "85fdff5d2a2f9b8c2f568207aee91204016476b6dc5790baec9a5a3248cc81f1"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.186/trebi_0.2.186_linux_amd64.tar.gz"
      sha256 "86062195b637950321fa818466fa7a59b527087ff4d5887f9ba3c99eec5476f2"
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
