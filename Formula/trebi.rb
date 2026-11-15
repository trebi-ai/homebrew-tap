class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.215"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.215/trebi_0.2.215_darwin_arm64.tar.gz"
      sha256 "3876b7ccd3b3d21e84bb35ca4dc59a8ba13a3e76e6ba521d5a39c6c695630bce"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.215/trebi_0.2.215_darwin_amd64.tar.gz"
      sha256 "48006a23e96697ad17280759e097e15aac3ca0bc61089bc11e38db4dc87a3fd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.215/trebi_0.2.215_linux_arm64.tar.gz"
      sha256 "84c4b57736f3563691ec49fdf492b41c326bdcc32b5d6780be90eff202a90e79"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.215/trebi_0.2.215_linux_amd64.tar.gz"
      sha256 "5e0ab1b7a5aa355b3daf06b5257f044c03c8a29ef25cec203432c94f5a4057e4"
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
