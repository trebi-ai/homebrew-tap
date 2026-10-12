class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.107"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.107/trebi_0.2.107_darwin_arm64.tar.gz"
      sha256 "e28ced0d4f04c1218b08dd7c53ed690c624d682f6985e669d064e5ebd86db81a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.107/trebi_0.2.107_darwin_amd64.tar.gz"
      sha256 "fb1f9ab565c0d9f443ad1f9264685c4a8af7c185b092364ad2fce95c70890245"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.107/trebi_0.2.107_linux_arm64.tar.gz"
      sha256 "4e2be4435f0c8063564be26b40312500f50220a9aeed976601d82468a9b2d2af"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.107/trebi_0.2.107_linux_amd64.tar.gz"
      sha256 "8f29cb609825b50c870448da4a14b3d7ccab39ffb645c08f1738c6e265064ffe"
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
