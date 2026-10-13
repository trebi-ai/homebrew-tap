class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.117"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.117/trebi_0.2.117_darwin_arm64.tar.gz"
      sha256 "34332def76ac997e734dbdb5d490afa1f902880ae284bcedad5def2a79b566b0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.117/trebi_0.2.117_darwin_amd64.tar.gz"
      sha256 "d578516aeb7cc1bb6d2fc551c24d58fe784f3d80c552f5b39be9b643e7f6bc16"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.117/trebi_0.2.117_linux_arm64.tar.gz"
      sha256 "25b6fb864a711f4dd43e293ac7725358effc4bb76ede7b13e07a15019bb4bdae"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.117/trebi_0.2.117_linux_amd64.tar.gz"
      sha256 "e65058b2d3ebb045c59cfc18aac165efde7bc43ac8a2d3d44bb184da5fe72b03"
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
