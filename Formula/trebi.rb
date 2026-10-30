class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.165"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.165/trebi_0.2.165_darwin_arm64.tar.gz"
      sha256 "ab343300bcb20a60ad906dcd03ec6b36f96a29cfbf3158e4ce1259d17d37f4dc"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.165/trebi_0.2.165_darwin_amd64.tar.gz"
      sha256 "c781b6ca5fc7f2b408365bd5fc0f23cfd897f015575256b56399d4856c6e4dbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.165/trebi_0.2.165_linux_arm64.tar.gz"
      sha256 "068435b27bed247bf0dddaaf2faaa8a6ffda714ba1bc6594919098a38fd40eb6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.165/trebi_0.2.165_linux_amd64.tar.gz"
      sha256 "dc3c3139552a68ca672d3d0c38e8c8442ba517d4fea9c3dbe8ba52f80a070303"
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
