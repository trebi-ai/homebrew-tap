class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.23/trebi_0.2.23_darwin_arm64.tar.gz"
      sha256 "a1e32f1107feba67f94e6a2166535ff07f98b90380547e0ea335ffd0754e6255"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.23/trebi_0.2.23_darwin_amd64.tar.gz"
      sha256 "68cbc31cfe23910fde2807615f3af6adb86a35c3526d257e0f3e2910eb497308"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.23/trebi_0.2.23_linux_arm64.tar.gz"
      sha256 "6437abd702d4460e26117dd3526fdc0ac0ddb40073a9c5f525545320ce227891"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.23/trebi_0.2.23_linux_amd64.tar.gz"
      sha256 "5e7d25a3b9eb1c9a76338fc31763133187da52ce69db9c2678f9d56119d9c1bd"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
