class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.240"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.240/trebi_0.2.240_darwin_arm64.tar.gz"
      sha256 "e43153291af89e896c68093af8e166431dd07bd976af1ca90ef71c349fd4823d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.240/trebi_0.2.240_darwin_amd64.tar.gz"
      sha256 "512bde7b05f466c8d1a51b2df7cb7d6cdcc4bb903ea7620a5c0cdf23493c2e62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.240/trebi_0.2.240_linux_arm64.tar.gz"
      sha256 "4339b663f64902945e55879e4b460dd43412c6feed047c0ae353be453ec9e7f4"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.240/trebi_0.2.240_linux_amd64.tar.gz"
      sha256 "c84f6a8b04c6503a50c3116957d601386a501d0fad515e917494b236ee983b28"
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
