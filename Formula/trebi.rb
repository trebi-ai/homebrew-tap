class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.89"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.89/trebi_0.2.89_darwin_arm64.tar.gz"
      sha256 "cd275d592c5cd34b5d7cf7a04e5b5909479308d0ec64e315d23eaee88811fb95"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.89/trebi_0.2.89_darwin_amd64.tar.gz"
      sha256 "2352534987cd43c7e29ece582264a8917163d27bed30d19cc7dc1398ada459e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.89/trebi_0.2.89_linux_arm64.tar.gz"
      sha256 "792d9eefeb32d87a8fa02bed90aca86324d49ac7d653d5c1cf0896a3e248f576"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.89/trebi_0.2.89_linux_amd64.tar.gz"
      sha256 "d86867cd63431ed3e2f3aef54701426d866653c4764e935e0147ff6fab79b92a"
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
