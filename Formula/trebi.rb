class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.181"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.181/trebi_0.2.181_darwin_arm64.tar.gz"
      sha256 "a4d6989164b5d745c10616d6f46084b7b5cd12d973c259067679704b17f1344d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.181/trebi_0.2.181_darwin_amd64.tar.gz"
      sha256 "c3641c753575b52c8bc970279e95da2be6dab87052d27a9ca3ff19a2fd02d4ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.181/trebi_0.2.181_linux_arm64.tar.gz"
      sha256 "937898875028b885f542ccf39705165c60de8d304df1ed01da3fb7f8febf1de3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.181/trebi_0.2.181_linux_amd64.tar.gz"
      sha256 "4d40aa0c9a3684934e224a9624bb535471727f991d565a63e4aee68f17120dd3"
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
