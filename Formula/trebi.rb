class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.120"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.120/trebi_0.2.120_darwin_arm64.tar.gz"
      sha256 "34fa16638bda6de5b46d55c89c17a420df635790f0d8d8d8a640570f422c35a6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.120/trebi_0.2.120_darwin_amd64.tar.gz"
      sha256 "f0ef6b7c734de6da5957b95d0f947bff4b213d1c36adf0ab30adf181d90851f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.120/trebi_0.2.120_linux_arm64.tar.gz"
      sha256 "251cd975cc0f5f1d36bbf59d310d58cd203602602f3c4ea2301fc610de8af2a8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.120/trebi_0.2.120_linux_amd64.tar.gz"
      sha256 "309c39c86e7da3299d57360271ddd877cb2d11829e4a23fb12e8030543af02fc"
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
