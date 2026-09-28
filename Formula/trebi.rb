class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.27/trebi_0.2.27_darwin_arm64.tar.gz"
      sha256 "30c0deeb8161c8add8f23fa6c65fed26fa16b0a0a0b22f5479a8fa2ed9d6385e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.27/trebi_0.2.27_darwin_amd64.tar.gz"
      sha256 "c97136fe04dc7deadb743d4dce086fd08c78ace86384f005d94f62cb8f047b5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.27/trebi_0.2.27_linux_arm64.tar.gz"
      sha256 "b97dc37eda6682ae215af1f2758238a8007f42008af21cb1587608ab4f7ef08b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.27/trebi_0.2.27_linux_amd64.tar.gz"
      sha256 "c8663607900dfdce8e5f1e7108c6d156310edad0ba52c2cdcc3d5693414b767a"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
