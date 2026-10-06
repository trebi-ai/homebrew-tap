class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.62/trebi_0.2.62_darwin_arm64.tar.gz"
      sha256 "c176e1e4e8dfa1f5b2680ff0bbc786861e42b6e45f3b5a74182a736af3841b64"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.62/trebi_0.2.62_darwin_amd64.tar.gz"
      sha256 "03db2fd20322a06935cbdb19246a5816bed9c51c74a719379688f16e4f60949e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.62/trebi_0.2.62_linux_arm64.tar.gz"
      sha256 "ab0cddedc673e13ca2207a20089e7794f9f2fefc4e01670dc742288b6b69ac85"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.62/trebi_0.2.62_linux_amd64.tar.gz"
      sha256 "56a2982ba37c5572f612f0e20140687478f56938cc164e2d8374ec671cbb3f33"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
