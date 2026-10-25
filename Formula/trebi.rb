class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.156"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.156/trebi_0.2.156_darwin_arm64.tar.gz"
      sha256 "d6b8cebc426a3af6fd00150f8650499387132a674f3d602acf11680ea5d6de2f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.156/trebi_0.2.156_darwin_amd64.tar.gz"
      sha256 "5908cf24fef30de172db3699c4793651c3889161486d80bcfd01db158f802a01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.156/trebi_0.2.156_linux_arm64.tar.gz"
      sha256 "2c0f86245499f3d5fd22c14a8becde21e3549316ff0183befc668623743d3583"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.156/trebi_0.2.156_linux_amd64.tar.gz"
      sha256 "dcce47e9a76863f31ad8dc25ad1672ba7178e1f83857527061838dc20297822e"
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
