class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.219"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.219/trebi_0.2.219_darwin_arm64.tar.gz"
      sha256 "ef1dd1379321d2fb40c3621f6f294af79fd152b4d464f15f0a86b9dc75c81999"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.219/trebi_0.2.219_darwin_amd64.tar.gz"
      sha256 "b908b0f30db3aa9a21d054623e0cced3cffd0e574dbbc1a4bb8fae44b2d65545"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.219/trebi_0.2.219_linux_arm64.tar.gz"
      sha256 "034fc8d05154d2d464b1b24f40873e7b6975445fb247cfef5f9bd85180a3386e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.219/trebi_0.2.219_linux_amd64.tar.gz"
      sha256 "8d62f7e5b3e1847a02fa36bee7c84d979a5bba93c5c718f473c8118255e5d79d"
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
