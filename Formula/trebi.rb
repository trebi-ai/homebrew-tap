class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.191"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.191/trebi_0.2.191_darwin_arm64.tar.gz"
      sha256 "79f4fc09c4d994fa9dd6bd6adfc6f2d2d867789397c392c902b09799efacea43"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.191/trebi_0.2.191_darwin_amd64.tar.gz"
      sha256 "362490ed9b0e55ba155e4ebdb2176324855105aa0582d576dd23ebd32157eab1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.191/trebi_0.2.191_linux_arm64.tar.gz"
      sha256 "bca6214e0cee94c04c2e0a879baef4df0f4e00b4d5fbcaf73b56b18b8af62056"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.191/trebi_0.2.191_linux_amd64.tar.gz"
      sha256 "5bbbeb8cc1c95954e322481bc72d554ca551634365a84f58b23c030067ee43b5"
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
