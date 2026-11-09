class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.198"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.198/trebi_0.2.198_darwin_arm64.tar.gz"
      sha256 "5ad761a743969a23f376c5464db0c44f2d3b7ccadd99ca95791c62bf65d97e5a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.198/trebi_0.2.198_darwin_amd64.tar.gz"
      sha256 "d4784e0c845202b8ba5d113cb626760ddcec3bf54f34072d3f77140cf641ef2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.198/trebi_0.2.198_linux_arm64.tar.gz"
      sha256 "0178f7ea3e275236632b43370c40250d37588fc544ac2c01df4a6409fda11080"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.198/trebi_0.2.198_linux_amd64.tar.gz"
      sha256 "792da173a2726d147ba7db6360a76ac5b740f374094e1bcf3d6b860488342d91"
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
