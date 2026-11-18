class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.218"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.218/trebi_0.2.218_darwin_arm64.tar.gz"
      sha256 "933755d062adc5db4746f1a413235ce74422d08e5fe47418dd2b0b1c237e249a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.218/trebi_0.2.218_darwin_amd64.tar.gz"
      sha256 "5f3b6fc81aefc3912fad72e60d55b768317971a07131f119c4932cd06a3289ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.218/trebi_0.2.218_linux_arm64.tar.gz"
      sha256 "2d1b45f6b9ea0ead26acf803b1fd59f1b1c91fef727c899b1e490af7fc6fb55a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.218/trebi_0.2.218_linux_amd64.tar.gz"
      sha256 "09cfd99673b58971b0c1e584083f8245fdf757d8ea01887ca0c2e6d483c036b9"
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
