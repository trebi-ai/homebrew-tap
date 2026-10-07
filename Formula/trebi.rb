class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.65"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.65/trebi_0.2.65_darwin_arm64.tar.gz"
      sha256 "c54c313421bac311f8e21a932a5de894aad2a46b5bdb0c3fbaf1895c89937aac"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.65/trebi_0.2.65_darwin_amd64.tar.gz"
      sha256 "01afdbb793961a0763ea103d72b46343c485ffb7b678aa8fc5dc671881855dfb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.65/trebi_0.2.65_linux_arm64.tar.gz"
      sha256 "8ec56539ab87510831f0a7cfd8a9d71dec3af2a6cc6f927bd0cff623c659b8e5"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.65/trebi_0.2.65_linux_amd64.tar.gz"
      sha256 "e978eeba952edfff6e253fc13ba4e60b1a47df7145eba2899dcad30bd464ec6b"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
