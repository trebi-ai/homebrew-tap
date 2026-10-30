class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.166"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.166/trebi_0.2.166_darwin_arm64.tar.gz"
      sha256 "d6603440a1a80ba092c8972a95ca08143f3d15826a1059f7a47f80a061ca00e0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.166/trebi_0.2.166_darwin_amd64.tar.gz"
      sha256 "95bee2c671ef05e81acdd0aa8fbb147b7b57df5008c04606130ada5f048b32d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.166/trebi_0.2.166_linux_arm64.tar.gz"
      sha256 "b97dcf8ae29e75877f356584a1fc6ce747b475a11d93a787f4ad1c1af9a9f090"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.166/trebi_0.2.166_linux_amd64.tar.gz"
      sha256 "db0dbdeed51bba6807c21c74a1556abe7dcfee64baf04e3aefb0a2bae9fc31be"
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
