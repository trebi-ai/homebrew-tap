class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.112"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.112/trebi_0.2.112_darwin_arm64.tar.gz"
      sha256 "755f6a48de715d3e8743ab6881f2e66362b47c471f70586faa30bee535104d3c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.112/trebi_0.2.112_darwin_amd64.tar.gz"
      sha256 "b3dacfe7ad8df28895f76194b46aa579987c19c87eceb64ebaac0a80c1dff2eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.112/trebi_0.2.112_linux_arm64.tar.gz"
      sha256 "f8a17a515bed6d6cf61aa48a6f4bfbd9fbfd4aa9281391c62a9564d935484bfb"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.112/trebi_0.2.112_linux_amd64.tar.gz"
      sha256 "1c4bff6aecb8102af7bdc62d146372a05b6c02bf28d7bf7bdede6616d77e75dc"
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
