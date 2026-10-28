class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.161"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.161/trebi_0.2.161_darwin_arm64.tar.gz"
      sha256 "0a1ca94a9d083c3c945f606312b9f176d03212fb0ccf569073312ff323fb2581"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.161/trebi_0.2.161_darwin_amd64.tar.gz"
      sha256 "c8504d3fd01473b120ec75cf1dce48a873914316bb9c2fab27bc9b0ef8b73806"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.161/trebi_0.2.161_linux_arm64.tar.gz"
      sha256 "b49dd0fa760e5bbc12711781d3f54a2c6480afdc6dd9b67e23da01ebf40349db"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.161/trebi_0.2.161_linux_amd64.tar.gz"
      sha256 "e6e8d77928ea4e89a82c6f4a7597dd4cbc99dffa50d3558cc6c9f23024662109"
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
