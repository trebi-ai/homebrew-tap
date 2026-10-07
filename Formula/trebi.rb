class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.66"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.66/trebi_0.2.66_darwin_arm64.tar.gz"
      sha256 "71904ba348dbdd502fa2ecb83329ce33d96e48e879b24a9ffe333e6e9f781798"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.66/trebi_0.2.66_darwin_amd64.tar.gz"
      sha256 "59e99eac2eab71ec5f9dcce7e13c20ff1386f5ad76390ddfdf0f84315d24bb46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.66/trebi_0.2.66_linux_arm64.tar.gz"
      sha256 "55a0d44c4e3976451078a7b2a41324668b1550263a1fb47d6fd1b59b22db2526"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.66/trebi_0.2.66_linux_amd64.tar.gz"
      sha256 "24d17c799d306e169036a26a952adbea4aeb76268e2e39fd976c331f79216f77"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
