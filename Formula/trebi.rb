class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.149"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.149/trebi_0.2.149_darwin_arm64.tar.gz"
      sha256 "8fdd38f2aa61e1ca1b32e5c223af90ed41d44d44021b215e3c0f2e9b3924e150"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.149/trebi_0.2.149_darwin_amd64.tar.gz"
      sha256 "fdf2dcd15f365a68bf5f4abf1aae530c93b8bc55a76acb71f4a1157115e0737f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.149/trebi_0.2.149_linux_arm64.tar.gz"
      sha256 "53c2eea6bcabb754823f0d06b260c8cb251d3d38a5096cc2e1e4ef215b5d9bc3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.149/trebi_0.2.149_linux_amd64.tar.gz"
      sha256 "65d0cf16ed0d890a86f3040a6f1921482e2798dfa8d3c4094c05d48ea182f974"
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
