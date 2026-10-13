class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.109"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.109/trebi_0.2.109_darwin_arm64.tar.gz"
      sha256 "3e9973a9a0afbad9668557caa894a4539a1c30b97f0d8bbaf99e980d6fea22b6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.109/trebi_0.2.109_darwin_amd64.tar.gz"
      sha256 "07c4ca3a52529eec8c71fde683881e7db1e0d7b4c242db7e7ceba34dece29150"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.109/trebi_0.2.109_linux_arm64.tar.gz"
      sha256 "4f76ba2bc1cde3a0876d8466c82dad8c3acd590b3307560260a4e8826006e060"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.109/trebi_0.2.109_linux_amd64.tar.gz"
      sha256 "0743a59b41c757be2f57e6508352bcde9ffd0cf354c9284c498c0bc43b45baad"
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
