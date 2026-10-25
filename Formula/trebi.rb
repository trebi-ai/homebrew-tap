class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.154"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.154/trebi_0.2.154_darwin_arm64.tar.gz"
      sha256 "8cbdf999edd66b718dbd7a188acda914098b7fd826f13b8e95f34693500b03a5"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.154/trebi_0.2.154_darwin_amd64.tar.gz"
      sha256 "b82789bc69bf3bc572ae88e362b3e966695bb56a7e3213f17a05242c389ce77c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.154/trebi_0.2.154_linux_arm64.tar.gz"
      sha256 "5e00555211c48071ee7ffc2659b9392fe9e60cc9596f91ca4c2cb5958cd195a8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.154/trebi_0.2.154_linux_amd64.tar.gz"
      sha256 "762ee61648fbb2b6265ce1c51e5facc2d19abcf925805addd8f8014bd88cc1c2"
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
