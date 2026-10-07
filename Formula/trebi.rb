class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.69"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.69/trebi_0.2.69_darwin_arm64.tar.gz"
      sha256 "e8ee161b6b2cc6793a700ba139c6ba4fc1666f577cca7f4811525b59fe89206e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.69/trebi_0.2.69_darwin_amd64.tar.gz"
      sha256 "64199bf2c03aaf90fad66636d5645b7699f20ff756176c98bfb22ad9c5f00958"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.69/trebi_0.2.69_linux_arm64.tar.gz"
      sha256 "11c8e2af9edfe3bfb5570a9a774d1f0010cb1cdd04ffe673e288bdca6ba803c7"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.69/trebi_0.2.69_linux_amd64.tar.gz"
      sha256 "698210ae788629a2030dcfb58afcce07bafa929538e0a206c81be450f4b5e135"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
