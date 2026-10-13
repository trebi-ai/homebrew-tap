class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.110"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.110/trebi_0.2.110_darwin_arm64.tar.gz"
      sha256 "2308447d79809e237a7ff945629497c2c3c7d60bc5e82f6f0cecf2decd5aed71"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.110/trebi_0.2.110_darwin_amd64.tar.gz"
      sha256 "8d1cad07b3fd08e736ba04607c9215991c4b7fb6df0957f601ca09c9d60f4142"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.110/trebi_0.2.110_linux_arm64.tar.gz"
      sha256 "614681c7ba2443871a246a4fca36dffe72d3a495eb73c474bd85fc15938698ed"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.110/trebi_0.2.110_linux_amd64.tar.gz"
      sha256 "9fbc721a7e82b14147bc476fcd5f3b324fb1c7aa3fba98ec432c24fa76a8784a"
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
