class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.209"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.209/trebi_0.2.209_darwin_arm64.tar.gz"
      sha256 "2c58b4edbb7f3fd972f31ffd08f59c30741a024ce3ce8b196f4e1645001d06c6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.209/trebi_0.2.209_darwin_amd64.tar.gz"
      sha256 "3a761f57da2f9018c0b14af3d9202f8dbc0be49182f94790f345099c44076398"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.209/trebi_0.2.209_linux_arm64.tar.gz"
      sha256 "ff4f129b2ea1e74105f6044e04afe81028ebe2b15f4448606eaf28a47abe793f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.209/trebi_0.2.209_linux_amd64.tar.gz"
      sha256 "e03ef029e09b36e14bde7b5dd3cdce41289063d59d955b90fef3992f4d19b426"
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
