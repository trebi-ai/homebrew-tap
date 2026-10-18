class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.131"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.131/trebi_0.2.131_darwin_arm64.tar.gz"
      sha256 "3ea79c38f4a761a83a596942fa1328b2946bf82dc5f4ae305c11a9200a710b6a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.131/trebi_0.2.131_darwin_amd64.tar.gz"
      sha256 "582a9adf1714d77cabf67b6e540078c64ff00a3ffd99aa539286fc26e2662185"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.131/trebi_0.2.131_linux_arm64.tar.gz"
      sha256 "c8c8c2329fc11c9135a8844483e6e0a58c0f7606b7bf0bf895c1cbec643c22b1"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.131/trebi_0.2.131_linux_amd64.tar.gz"
      sha256 "4d5426d252ab806f548671ffcf9fb64ae295556ceb3ac1c6b930f6804f353112"
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
