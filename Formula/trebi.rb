class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.187"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.187/trebi_0.2.187_darwin_arm64.tar.gz"
      sha256 "a9af55bc00d6e895e9b5736eda38e034815a4404cfffb7859d928bfb2e05a783"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.187/trebi_0.2.187_darwin_amd64.tar.gz"
      sha256 "438f5f380ab351e14b2f7a8e930cf36c3aa49889209c1a7a039cd185f459ad17"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.187/trebi_0.2.187_linux_arm64.tar.gz"
      sha256 "fed190cc6cfc4f3b6a1f299ccd6d57bd258afc8b839446670c7b47f58929f5f5"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.187/trebi_0.2.187_linux_amd64.tar.gz"
      sha256 "2bf38e88fe8ecf04a29fe081e5176acd6c2c933bf5a2abe68400c6dee2d3c706"
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
