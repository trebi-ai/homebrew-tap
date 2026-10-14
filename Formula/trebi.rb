class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.128"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.128/trebi_0.2.128_darwin_arm64.tar.gz"
      sha256 "20aacc7be61afb70ae7c1bb573cf901f11384b382e9aaa3ee876501382f055ad"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.128/trebi_0.2.128_darwin_amd64.tar.gz"
      sha256 "1f62ec3804b02d8e6bafa5b6333de529afe91b9a9ed317b8ace4c989a9c37262"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.128/trebi_0.2.128_linux_arm64.tar.gz"
      sha256 "1b2d2b821d3f08435ab32e911af4b00ae6890aebde0b58a2bc0ddef5eb58a2ff"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.128/trebi_0.2.128_linux_amd64.tar.gz"
      sha256 "a781f3d14b791792be55bc6a9d22966203460d23a74da080a0619a0c2d1619ac"
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
