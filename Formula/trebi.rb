class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.243"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.243/trebi_0.2.243_darwin_arm64.tar.gz"
      sha256 "ef08fd5d1691eb56810a013f7f61cd131207040394654b1fb0e7f9558ee303ca"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.243/trebi_0.2.243_darwin_amd64.tar.gz"
      sha256 "8e3453a0982b384e94ad999cb1fa032a1137ab8d4d820c1ac3784925395de0f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.243/trebi_0.2.243_linux_arm64.tar.gz"
      sha256 "c8abdc5591f64968d248885d147fc99c5b3dd437f720b4562ce060cee970bd86"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.243/trebi_0.2.243_linux_amd64.tar.gz"
      sha256 "c518563e6d357c03676cf6812e9b27c8c5d084fe76d3a43f542baed0115fccc6"
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
