class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.142"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.142/trebi_0.2.142_darwin_arm64.tar.gz"
      sha256 "69b1b7e467cb0353117b0bd982fb6ae8d488b8a86e1d4df466fc76eab4d60091"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.142/trebi_0.2.142_darwin_amd64.tar.gz"
      sha256 "83daccd5a077747ede322dece310a80a277b0b1e034255fadfc82f2530214ffc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.142/trebi_0.2.142_linux_arm64.tar.gz"
      sha256 "5cd27f54c0d6309e32558f0639fa4aaccdef39b3701fb983561487fb2ac796a0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.142/trebi_0.2.142_linux_amd64.tar.gz"
      sha256 "a69876c74b813d1840bb71877aa0ecacc5ba21fa7f3d3fbaecf616e3db50f03e"
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
