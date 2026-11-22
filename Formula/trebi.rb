class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.237"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.237/trebi_0.2.237_darwin_arm64.tar.gz"
      sha256 "81eabbd9c9491bfa1c1f7b60f5eb50dd2680b9a40a48e32a7842f6b7c6a78e20"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.237/trebi_0.2.237_darwin_amd64.tar.gz"
      sha256 "959281b0b8931c085a8e6cfc4778e55f55c54506fcb17963af4ae2372f815f3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.237/trebi_0.2.237_linux_arm64.tar.gz"
      sha256 "e491c1e244e9bea978fdc4a785a5a3e98462e8d529a133bf212d4645a68b29aa"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.237/trebi_0.2.237_linux_amd64.tar.gz"
      sha256 "701633806372d42885e26e3cfa72518ec5d56efda7de1d055a3719a210861d52"
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
