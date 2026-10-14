class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.125"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.125/trebi_0.2.125_darwin_arm64.tar.gz"
      sha256 "81695f4a8dd5a7cd229ae016341223e748123f2cac34c0d084f3aefd5edb02fb"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.125/trebi_0.2.125_darwin_amd64.tar.gz"
      sha256 "bf647200375f04e3409ed02533cc86e986c67dffb4a9311d23c746bf9d6e4e07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.125/trebi_0.2.125_linux_arm64.tar.gz"
      sha256 "f217d03c20f300868ca34c89fe85c1623825fc1e65935544080f758794d0f11c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.125/trebi_0.2.125_linux_amd64.tar.gz"
      sha256 "bb753d6b7752a4fb501152ee29b86d9f1c0ff71e9bd8eb8c1c80e4a3951ea89f"
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
