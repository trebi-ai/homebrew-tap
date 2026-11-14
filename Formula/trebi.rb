class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.212"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.212/trebi_0.2.212_darwin_arm64.tar.gz"
      sha256 "26fc5ff85b3367e47ed1ff44d8257832f2c23cbf8fadc264991cd67a6e49d386"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.212/trebi_0.2.212_darwin_amd64.tar.gz"
      sha256 "80f222bcbd55fd739fb8921f366e66549d7e4b9c5bd5a1509585ea5466e08380"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.212/trebi_0.2.212_linux_arm64.tar.gz"
      sha256 "705a29015b9904c88f7f8f7d98c729b44fdb65e41c888be4f66849104fcd0048"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.212/trebi_0.2.212_linux_amd64.tar.gz"
      sha256 "357a5ec032584db3a6e0536a940918b62c6be6c116a640f01aa1cd59e4e0d2d4"
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
