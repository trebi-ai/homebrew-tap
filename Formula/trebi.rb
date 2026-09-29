class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.30/trebi_0.2.30_darwin_arm64.tar.gz"
      sha256 "3849eac7dd3e2e494d028245012ec98f66c941c1d081b0f442c8d9c516271f1a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.30/trebi_0.2.30_darwin_amd64.tar.gz"
      sha256 "ed40f1df6b8e0885ae77909e8247b0b362259b902b06389481103f17b93ed57e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.30/trebi_0.2.30_linux_arm64.tar.gz"
      sha256 "13b3667cc72270e429d1630f80d8d347d1245599b07a8a55c004a33e6f6da3af"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.30/trebi_0.2.30_linux_amd64.tar.gz"
      sha256 "878689c237b14a63c5e4d60a94f031a8c293605c53eb331aa002a11b75186c9d"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
