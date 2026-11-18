class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.222"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.222/trebi_0.2.222_darwin_arm64.tar.gz"
      sha256 "18125ec79d8153c1d489b9e884dd3bf0795354c30eed4602cb1dabd68a44cb35"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.222/trebi_0.2.222_darwin_amd64.tar.gz"
      sha256 "34c1cdc35e2b0f1e4ad5a2617c1d499fb6146b6e428da14b7dd121a0002cd0d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.222/trebi_0.2.222_linux_arm64.tar.gz"
      sha256 "d294dd4ccd4a6cc36bfb8a3d4d3c781fc9fc5231bc2e3327490621ede8588f95"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.222/trebi_0.2.222_linux_amd64.tar.gz"
      sha256 "377fb5b951fb4181b81020a640ef7cae4906f74a29328ce4c838002a0659dce4"
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
