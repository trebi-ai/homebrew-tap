class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.201"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.201/trebi_0.2.201_darwin_arm64.tar.gz"
      sha256 "8b8dcd608b3427f88ef8a208caa3845c3f76f20f8f406cd785401f5b570623e9"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.201/trebi_0.2.201_darwin_amd64.tar.gz"
      sha256 "0ad9c52dfd3a45945239d35d4e971d3dc7610b526c5b4dcb7b6bd7b98afc9d44"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.201/trebi_0.2.201_linux_arm64.tar.gz"
      sha256 "07a00227937c8b6c7217f81f021b12ba8572e5bdc74939c089681461defb01a9"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.201/trebi_0.2.201_linux_amd64.tar.gz"
      sha256 "21478bc41c0d415d64135538480020a74c8d7a59717de54481d2b36cb17458dd"
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
