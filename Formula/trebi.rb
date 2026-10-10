class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.83"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.83/trebi_0.2.83_darwin_arm64.tar.gz"
      sha256 "fbc89a587b3f916b2a5565728ccb4aac88d1ab9320766e3567f125890d011c72"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.83/trebi_0.2.83_darwin_amd64.tar.gz"
      sha256 "9b47415412b7490326ac799b066a264f29d0dd8c908125124962359f724ca1d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.83/trebi_0.2.83_linux_arm64.tar.gz"
      sha256 "cf692927729a05357f3d33856a7305c761d13fc001602f9194c05365daf70d0f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.83/trebi_0.2.83_linux_amd64.tar.gz"
      sha256 "3badd210564027554c6c184361a433c9d7367ccba04e79e9427089c0cb045cf4"
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
