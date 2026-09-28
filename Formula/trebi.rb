class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.24/trebi_0.2.24_darwin_arm64.tar.gz"
      sha256 "67fc1b315dbc54c7f3882b76e3c777c494c90e06015a3fd4841032afadffd499"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.24/trebi_0.2.24_darwin_amd64.tar.gz"
      sha256 "216ad57fb0fee9f59d699449cf5ec02cb2692d4a7ce91ed24814fc4a60e66c63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.24/trebi_0.2.24_linux_arm64.tar.gz"
      sha256 "30872ae811520e169361a2af9fafbc21e53d25782032524a330870ff06d6eafe"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.24/trebi_0.2.24_linux_amd64.tar.gz"
      sha256 "6cda0b6cae092815408a63b6c10612b61a5f932d480c929f2d9efbe1b7c0ceb8"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
