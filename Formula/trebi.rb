class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.79"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.79/trebi_0.2.79_darwin_arm64.tar.gz"
      sha256 "fa419f4b7b38231cfeda64673efae49f39e29d0073919e6f08a012b695ea6cd0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.79/trebi_0.2.79_darwin_amd64.tar.gz"
      sha256 "cdcab508515a8b9ab8227bfbb2fc7cf5beff3dfb44ae0cf09c7b4c6169c481d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.79/trebi_0.2.79_linux_arm64.tar.gz"
      sha256 "99859af04f4d984b3b827c50cada81a170b0a9d4e375d128bf38dd728f05bbb1"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.79/trebi_0.2.79_linux_amd64.tar.gz"
      sha256 "c1f3921e78cb93e496a7754020710ed2eac0e12a2ffd92c05833c7c6aff84a31"
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
