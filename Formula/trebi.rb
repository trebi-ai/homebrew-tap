class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.52/trebi_0.2.52_darwin_arm64.tar.gz"
      sha256 "00f18f4690d1155b811c642aaaecbb518be5128e14792bfe4ceb14ab7713dea8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.52/trebi_0.2.52_darwin_amd64.tar.gz"
      sha256 "9d708ca8fad2a5d4bf4c3823318720102542734f6ad1bd6b64063068ec9b42f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.52/trebi_0.2.52_linux_arm64.tar.gz"
      sha256 "3efbb024ca2fd0991c847fd648138b713563a11b0d3fd6a6e92d799054165c7c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.52/trebi_0.2.52_linux_amd64.tar.gz"
      sha256 "b58c7cc8315dc865ce09e6347076cda652c90c81657e2da7df9010bac6951bb1"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
