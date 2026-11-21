class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.231"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.231/trebi_0.2.231_darwin_arm64.tar.gz"
      sha256 "d50fa43a75aba765399f98b1a951f6dd7da05ed5726a16e778c0411906143e03"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.231/trebi_0.2.231_darwin_amd64.tar.gz"
      sha256 "539d08022b93dd1f3cb20b23a6517bc67d9d6b2881f68f2c4a62c271637159f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.231/trebi_0.2.231_linux_arm64.tar.gz"
      sha256 "b38d2acabbff76ac488e66cad03171202793abbfff02eab4dae2f5040287d325"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.231/trebi_0.2.231_linux_amd64.tar.gz"
      sha256 "cf83c74544165a8d33ae69b3bfbe2b473a16854ff8929195ee6a3b1cd896d2e8"
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
