class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.241"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.241/trebi_0.2.241_darwin_arm64.tar.gz"
      sha256 "763a120a9dc531ebcbdc12fc78a0c81ca40dd923bc940788906830a673c807b7"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.241/trebi_0.2.241_darwin_amd64.tar.gz"
      sha256 "d093b92754dbe46e4050c4914871326e339cb36aac117847e9df3f28e20e9336"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.241/trebi_0.2.241_linux_arm64.tar.gz"
      sha256 "250d4d050f929062beae2bddbd0f6e1b2ee5d2d55b7044b490f9587004409acb"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.241/trebi_0.2.241_linux_amd64.tar.gz"
      sha256 "f0ea01587bd8d25730a12d38a19a8b54cbacc22040ed95499df6ac911e287fb2"
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
