class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.177"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.177/trebi_0.2.177_darwin_arm64.tar.gz"
      sha256 "ab43e3bb366f08e1eb8be2a2cfcc13e09f12ed79a93cd7ec2671f084a2d4654f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.177/trebi_0.2.177_darwin_amd64.tar.gz"
      sha256 "4aa5e5f1e8a0a74cd0b89c9443c0e96495563c9553870d7960a9df647e466b90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.177/trebi_0.2.177_linux_arm64.tar.gz"
      sha256 "23572cd802541b4078970d6493f66fec790c759efb7112717a61edca5f455c9a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.177/trebi_0.2.177_linux_amd64.tar.gz"
      sha256 "d413bb25380e1dac039276602db092109f67ca39f5193b96dd9ee8374b89d32b"
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
