class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.229"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.229/trebi_0.2.229_darwin_arm64.tar.gz"
      sha256 "97e6f8b041b92d992ddc06873805e5e0c7c7c43b90cca7345fdf7c13050b4486"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.229/trebi_0.2.229_darwin_amd64.tar.gz"
      sha256 "ecaa1fe630fa0a9ba53408cd2ee6c16295351b5152a9fd28163ee7101b48874b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.229/trebi_0.2.229_linux_arm64.tar.gz"
      sha256 "a1260177c5c6e297bb367c2af3ed6a85683071040f0c963fe5176ea3b281ae7e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.229/trebi_0.2.229_linux_amd64.tar.gz"
      sha256 "b78cedc5bf8645a529fc71dd2f3143bb0e048688d9dda28bb1a97a49af015c7e"
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
