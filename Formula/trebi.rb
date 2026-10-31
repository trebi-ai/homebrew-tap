class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.173"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.173/trebi_0.2.173_darwin_arm64.tar.gz"
      sha256 "fd1804c88739c0f8c2f9d91a7a995ddbbc9fc311f134e524f3d18aae423de276"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.173/trebi_0.2.173_darwin_amd64.tar.gz"
      sha256 "231ac6b910e69e2ff63029a8d351c348647ff32d4ee0f208569e98cf876a7baf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.173/trebi_0.2.173_linux_arm64.tar.gz"
      sha256 "15c5032a67f44a9de4e6bf5e8751520bc00d37dbb9a0594d015fc8822d4953a9"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.173/trebi_0.2.173_linux_amd64.tar.gz"
      sha256 "b4834bfccf8501f48768d8afae6a4473903d016f59cc50ebae4d43f950ed57cb"
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
