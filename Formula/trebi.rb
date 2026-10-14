class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.122"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.122/trebi_0.2.122_darwin_arm64.tar.gz"
      sha256 "8df1c04e3732cd55c493e26a0ae29087c713b69b22943cda95d6754141a68a83"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.122/trebi_0.2.122_darwin_amd64.tar.gz"
      sha256 "13790f7a108694da19501ef3a104ba1006828ac014d132bd4a76ee0535a77e3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.122/trebi_0.2.122_linux_arm64.tar.gz"
      sha256 "04b595775759c95f3048267cd06741cab9b3d612ce620fb7b8a848565308b621"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.122/trebi_0.2.122_linux_amd64.tar.gz"
      sha256 "52c56bb563acb2e181e5156ac98c153a8be3eba8eb353a00610e362e668a6086"
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
