class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.210"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.210/trebi_0.2.210_darwin_arm64.tar.gz"
      sha256 "e364a18f5674c266467e3c93dfe28a233f65499fc468c9749b06b1eaed99fe51"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.210/trebi_0.2.210_darwin_amd64.tar.gz"
      sha256 "c262c7d88156ff4fbe8f8900844e0ba1c6a0d4d31b90d3f268722b8115c14977"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.210/trebi_0.2.210_linux_arm64.tar.gz"
      sha256 "03a02dd20c68327676163d920f7ada208b65c1e4009205ee693a9793204a84b5"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.210/trebi_0.2.210_linux_amd64.tar.gz"
      sha256 "89924b5af5e910310fa1e74dc9ce23a3ae182554089e2e764cf341fb86a81526"
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
