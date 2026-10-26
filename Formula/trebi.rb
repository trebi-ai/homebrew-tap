class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.157"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.157/trebi_0.2.157_darwin_arm64.tar.gz"
      sha256 "295acf41f3681314c936942ea1fe3fc34a8560bef6d035311568509c67bde569"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.157/trebi_0.2.157_darwin_amd64.tar.gz"
      sha256 "99ad1042b72415b242142ddcfe01c0d0df86c79a85e4f15ffa40d856334c232d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.157/trebi_0.2.157_linux_arm64.tar.gz"
      sha256 "a244a82d5f7b1b3cebc95db994041cb7d80828f2a71ea7ee7dfd43e3088817fa"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.157/trebi_0.2.157_linux_amd64.tar.gz"
      sha256 "085fd6c4fcea9d515ce24c4d6a24afc6340102fc1c3ea40f71b49fa54393559a"
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
