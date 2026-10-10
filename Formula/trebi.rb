class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.82"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.82/trebi_0.2.82_darwin_arm64.tar.gz"
      sha256 "214ba4e1cef28182d6ae5ba5985048fbf63b435f7047085d48fcd4d8141a2f20"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.82/trebi_0.2.82_darwin_amd64.tar.gz"
      sha256 "6118d5e01a1f966f132362bf17eff5f780a705add4526d10a47c5c751da747ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.82/trebi_0.2.82_linux_arm64.tar.gz"
      sha256 "c5c01c62c8f8bbdd3d9c262ec12525db5d5cb45e5a3803fc1d212d2fe78e175f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.82/trebi_0.2.82_linux_amd64.tar.gz"
      sha256 "aa85912cc02851142cd9f5a36943146d21b1fc280a89b02ac83e3524f16f3a44"
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
