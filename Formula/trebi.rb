class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.6/trebi_0.2.6_darwin_arm64.tar.gz"
      sha256 "f365517974c0ca47e36256a06d5bea33fef3353d69cb1c89df5ccb467796184d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.6/trebi_0.2.6_darwin_amd64.tar.gz"
      sha256 "f116dec9e555f75f940b18ec7f5a3f86004e922b333ea574b29a176b7186897e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.6/trebi_0.2.6_linux_arm64.tar.gz"
      sha256 "2bec50f4db4cd866626129133110bd8e962c7ca07375148ab99a7d1275f50413"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.6/trebi_0.2.6_linux_amd64.tar.gz"
      sha256 "b6d1836e4e2accf9cea99f3184053d8773199e1af27e9a21d190bde36695cfc2"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
