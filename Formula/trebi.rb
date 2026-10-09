class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.76"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.76/trebi_0.2.76_darwin_arm64.tar.gz"
      sha256 "5a690421580426f6b23d9c00dc3c2588d737a891147a8d64527e3fd31ec661f6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.76/trebi_0.2.76_darwin_amd64.tar.gz"
      sha256 "c44ab00273f70eea8240a5ff1fa3d75f57a754120224b0c0787582df75ef7bce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.76/trebi_0.2.76_linux_arm64.tar.gz"
      sha256 "153b3583dc1c9523b471e2398d6e0e61504e3592d4b543788aa3ad901fa79aa0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.76/trebi_0.2.76_linux_amd64.tar.gz"
      sha256 "446d1546c7d3f86abb1b663eaf66fe4b38a8ef72b553b303f3e12e906ac12821"
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
