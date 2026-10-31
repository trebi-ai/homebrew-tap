class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.171"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.171/trebi_0.2.171_darwin_arm64.tar.gz"
      sha256 "96f816ec48822dfcae0f97c987cc877d96016089162bdcaa661de18d5fd42506"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.171/trebi_0.2.171_darwin_amd64.tar.gz"
      sha256 "78b3067d9aa8d7b5eec5a798140af687bad4ca61043ce15b9fe77e1dfc217651"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.171/trebi_0.2.171_linux_arm64.tar.gz"
      sha256 "ec5b3e5ff43374324adeda440e2f6665db3aa7e82dd2340514bdf789d3079063"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.171/trebi_0.2.171_linux_amd64.tar.gz"
      sha256 "e0bb81e339eb9eb6cce22f605c81a15778fe5c2ca7960e2a34697a5c7d9131ed"
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
