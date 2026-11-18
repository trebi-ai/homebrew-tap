class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.220"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.220/trebi_0.2.220_darwin_arm64.tar.gz"
      sha256 "05558aab004f7b7fe86875cb760a0f4c2b19d5bf59149dfdf4806a249b498fac"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.220/trebi_0.2.220_darwin_amd64.tar.gz"
      sha256 "d77fc3d487700122e42d17822095cf471cde370235e1abd36487a8a0fbed62ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.220/trebi_0.2.220_linux_arm64.tar.gz"
      sha256 "72b922af5086750094751fd1572fc34b59b1d4143b23549bb25db6c71d32b3b5"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.220/trebi_0.2.220_linux_amd64.tar.gz"
      sha256 "d67d93d2edf61a112d541c22434d9bcdd41d84458459e684d8cf7b9c657f31e4"
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
