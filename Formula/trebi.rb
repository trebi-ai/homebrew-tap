class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.194"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.194/trebi_0.2.194_darwin_arm64.tar.gz"
      sha256 "18209d4742753c1515fe0c155d8cfc2c3b1fb0d7accdeb994bff3921bc1cfc5a"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.194/trebi_0.2.194_darwin_amd64.tar.gz"
      sha256 "3de53b484a474177ad9a9d5ce9b965c6459b2ceeaf170427a153798a36f75d03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.194/trebi_0.2.194_linux_arm64.tar.gz"
      sha256 "ee3d7e7335b28be7800444cce0c8aa3ee0b30ae5cd04a5848847c6a197db59dd"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.194/trebi_0.2.194_linux_amd64.tar.gz"
      sha256 "1cdd5856168c1cd6f359a3c3d36b4cfd958f925af1d3b725000d05721907ba47"
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
