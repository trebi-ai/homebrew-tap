class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.223"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.223/trebi_0.2.223_darwin_arm64.tar.gz"
      sha256 "dfc3bc974be336efffde7e96c339ef5d6db6d683e22d906d312b48b8251f635a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.223/trebi_0.2.223_darwin_amd64.tar.gz"
      sha256 "fed20903857eab10f8b8dcdd76a427dce9ead70b8f5c052bd501406f320c4257"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.223/trebi_0.2.223_linux_arm64.tar.gz"
      sha256 "3ffb9c7649315d46aa5e546f0e16850bb86df90801ae53cc8ded05a17edef6ab"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.223/trebi_0.2.223_linux_amd64.tar.gz"
      sha256 "a1ba6f2caa41f022c4029748f398522a98d197a66ae5ef02a3aeae7e5b225524"
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
