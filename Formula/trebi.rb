class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.80"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.80/trebi_0.2.80_darwin_arm64.tar.gz"
      sha256 "08eece2129d8a2b606f916a128e8089912fd89499c090c69f3863c9110301e87"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.80/trebi_0.2.80_darwin_amd64.tar.gz"
      sha256 "54d4f15a65886232292d916c133fe2b01c2e15fef06ac8cc66dd424eb2f44da7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.80/trebi_0.2.80_linux_arm64.tar.gz"
      sha256 "1a25ae31b44dda7342824568518fa8e399e952492c6ef0cebc2e24287236d199"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.80/trebi_0.2.80_linux_amd64.tar.gz"
      sha256 "f8032af0c9cb28be64da5717f818757b56300e61fe477d47538cfeb9d69eb5ed"
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
