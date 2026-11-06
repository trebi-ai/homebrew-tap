class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.185"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.185/trebi_0.2.185_darwin_arm64.tar.gz"
      sha256 "2fc480514c6c1fd26601f7bcaab2c7e9b10b9a78a7f0e2f3e3fe5f1f6cc20133"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.185/trebi_0.2.185_darwin_amd64.tar.gz"
      sha256 "46d959bdd911dde8bf1c0ad1981d2576e688ef9db4e6db739eb7092f29c110e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.185/trebi_0.2.185_linux_arm64.tar.gz"
      sha256 "25a02168d5a11df2ad3f109c29c3a35faf3e9d9ce8e9a1d249e91230ad0ec038"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.185/trebi_0.2.185_linux_amd64.tar.gz"
      sha256 "78da5a48eb7182890fa6fd5d2b4f3ae81087f7fd1343bc6d8db12dd912e2c89a"
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
