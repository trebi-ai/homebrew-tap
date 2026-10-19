class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.135"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.135/trebi_0.2.135_darwin_arm64.tar.gz"
      sha256 "46489994fe12915af4824ada89f3e8d65d870ee8d5eccf9369d2ad46bc1f40a5"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.135/trebi_0.2.135_darwin_amd64.tar.gz"
      sha256 "0e7c4cbf3b08adfc5fafcfd5378fa7139f9d944845b505ef6bc7d41bf52ca192"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.135/trebi_0.2.135_linux_arm64.tar.gz"
      sha256 "9fcc003854574cddec0aad98375b3f2ae55004cf989e42f71128ceaa62ac7425"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.135/trebi_0.2.135_linux_amd64.tar.gz"
      sha256 "0b8b8b084b1b95ad02bf56493c19eebf5b35f0e2580aa677b06d7894781d7fd7"
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
