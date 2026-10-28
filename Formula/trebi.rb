class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.162"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.162/trebi_0.2.162_darwin_arm64.tar.gz"
      sha256 "6aa739eaa3976e72a84262afede34126077be2e8e506e675da63f160a57b277c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.162/trebi_0.2.162_darwin_amd64.tar.gz"
      sha256 "b4974778ad5ced1f3959ffe0cb5b0aea5682a2e0c1351293f0eebcd25869f132"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.162/trebi_0.2.162_linux_arm64.tar.gz"
      sha256 "c2eef38947c6058cf8a52159d6e3cadffee85f88a8063e22ab9e9fe607096958"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.162/trebi_0.2.162_linux_amd64.tar.gz"
      sha256 "2f9dd614f570bc23863da1a3106e80112bca29e5dccb00e919c3a9ff9563d423"
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
