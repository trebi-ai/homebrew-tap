class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.121"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.121/trebi_0.2.121_darwin_arm64.tar.gz"
      sha256 "2d208d2900ff37549103fce4d42fdfdc311a5e6c409c4b65e41166ebcc57b6ab"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.121/trebi_0.2.121_darwin_amd64.tar.gz"
      sha256 "1076dd311a159c45a226e8a7cd2cfef2ebb3fb140bb270628ef0a922693bdcbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.121/trebi_0.2.121_linux_arm64.tar.gz"
      sha256 "c307cfef210be4ed37f4eee847e3da84c2aa8c971acc9fc09854b7a9b9063399"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.121/trebi_0.2.121_linux_amd64.tar.gz"
      sha256 "d3d7ef9ed004e2c687fefc72a96aa2931e64d5e3f0c3dfa69c097ed4a4db0b69"
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
