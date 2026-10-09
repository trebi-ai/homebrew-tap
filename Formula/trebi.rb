class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.81"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.81/trebi_0.2.81_darwin_arm64.tar.gz"
      sha256 "c7158a1d62299cece08375fe2cdfd09a59185833eec29be1cfd5ab3e4d4f17a2"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.81/trebi_0.2.81_darwin_amd64.tar.gz"
      sha256 "823f0ebbd01dd447d392275472c1e55a5651ee916e730f1d02ff57dabe311268"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.81/trebi_0.2.81_linux_arm64.tar.gz"
      sha256 "bd33adeba83c42cf0f414d4d9d04c267dbc51df1a2647413914195bc75aef689"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.81/trebi_0.2.81_linux_amd64.tar.gz"
      sha256 "05b28e3388e9476bfde45d92fce333f710f9ebf59a84c55f0f347f039d42a8ca"
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
