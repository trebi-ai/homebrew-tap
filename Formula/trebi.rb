class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.176"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.176/trebi_0.2.176_darwin_arm64.tar.gz"
      sha256 "d167531edabf638454f098068895f8c915a16df334a23aaf6800d7ad42db19f2"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.176/trebi_0.2.176_darwin_amd64.tar.gz"
      sha256 "74dd2677fef3d5eb0a182e0d4da8eb37dc0c59721cc4f340b09e83146b6cc49f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.176/trebi_0.2.176_linux_arm64.tar.gz"
      sha256 "0771e599bdeda9908b330dd619eed42d9fcf4dc3831e52bd2bfc4fe0aaea4707"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.176/trebi_0.2.176_linux_amd64.tar.gz"
      sha256 "ddfcad4f2dbd6dfdbb5279832b62bc31f43f951d79c8035ff9bc00ab05821ed2"
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
