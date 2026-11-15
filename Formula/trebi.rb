class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.214"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.214/trebi_0.2.214_darwin_arm64.tar.gz"
      sha256 "3ec37cdd96b744500d892653cbeb994ddf1e53cd1aea8c6c08c996585380dcda"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.214/trebi_0.2.214_darwin_amd64.tar.gz"
      sha256 "d9834555b5fda24b3a849552e3306daa8384f5f33da07c8b1ea50b77be2a344a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.214/trebi_0.2.214_linux_arm64.tar.gz"
      sha256 "14467b75aa8d6cad89b16e6c132357d8a82cf8d0fb7cd0a53eb2be633e670365"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.214/trebi_0.2.214_linux_amd64.tar.gz"
      sha256 "b231af4f8278b750eac58be43dd9754bd6ea6b515886cfea0074672bbc97ccfb"
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
