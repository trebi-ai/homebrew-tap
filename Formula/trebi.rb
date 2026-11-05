class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.183"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.183/trebi_0.2.183_darwin_arm64.tar.gz"
      sha256 "165f008793f6029f150fae282b443af87b6abfea1892f74fc29342c8aeacea78"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.183/trebi_0.2.183_darwin_amd64.tar.gz"
      sha256 "80fa321efb789590fb483530c664fb0a3dc2b954d0f81ba931a7137ed4ddee23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.183/trebi_0.2.183_linux_arm64.tar.gz"
      sha256 "c405be0119f7949a9a65ec83571e8fa7a2687a26a20e4ea2af6c4257fd9fb1ec"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.183/trebi_0.2.183_linux_amd64.tar.gz"
      sha256 "af584d3f97863d59881e58423647fcb042a7c1294f622d7651f7ed760d26257e"
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
