class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.193"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.193/trebi_0.2.193_darwin_arm64.tar.gz"
      sha256 "fe408a4eb0196a25cc42489878017e7ca9c46ea5f1ecd0bddb19e3844b14d437"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.193/trebi_0.2.193_darwin_amd64.tar.gz"
      sha256 "8f7a35c85e0916136e94514b6cbfb76e689c48b7c969a2e73e0d13144c8fb7cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.193/trebi_0.2.193_linux_arm64.tar.gz"
      sha256 "b93e3c0360f17898414064a657242278a7c73847ee47b56dfccf4907a6346295"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.193/trebi_0.2.193_linux_amd64.tar.gz"
      sha256 "d86ad04f56e82bf1796f82e59980f621431cee30f8ac4c3b65f2beae5c35cb21"
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
