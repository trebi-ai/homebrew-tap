class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.108"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.108/trebi_0.2.108_darwin_arm64.tar.gz"
      sha256 "adf9b07b7eb774ba41571f0fd67cac5bb3a5b3db44c6200f3b24ce603ad2d28f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.108/trebi_0.2.108_darwin_amd64.tar.gz"
      sha256 "2eb9dcaa1d409022eeeb9b942120bd90add8069bb536e5629216d91d74e36e28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.108/trebi_0.2.108_linux_arm64.tar.gz"
      sha256 "4fd86056505c366177077c66c3dc72f853c214d13fbad8efb63ff018afacdb71"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.108/trebi_0.2.108_linux_amd64.tar.gz"
      sha256 "93c742293f10746f4222339f297a5551628b004917e965f94262bba5e99bb829"
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
