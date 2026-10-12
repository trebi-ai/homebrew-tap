class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.99"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.99/trebi_0.2.99_darwin_arm64.tar.gz"
      sha256 "003ea422eb50da0120d181b1a3d1084a16f9cde4540821f2ca108c5c6df30199"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.99/trebi_0.2.99_darwin_amd64.tar.gz"
      sha256 "0e6ba649f33b76542e596a0b27f83b36e5d3e3418fd593f14d4d2cd1c8c18ae4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.99/trebi_0.2.99_linux_arm64.tar.gz"
      sha256 "2edf555221ed8b83c1eb674b66af47aa71d4cebfbaf0ebba2a58cb8724a9ad71"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.99/trebi_0.2.99_linux_amd64.tar.gz"
      sha256 "ee558835fafb35aca99f4344742ecfebca7ac8112f4fdecdbd752a8d55f15efa"
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
