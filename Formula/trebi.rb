class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.233"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.233/trebi_0.2.233_darwin_arm64.tar.gz"
      sha256 "9a220526e94907b924f1302c6c819075a53238d194fbcba00a676159a2b2bf66"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.233/trebi_0.2.233_darwin_amd64.tar.gz"
      sha256 "774dd21e3c47cc87b5cb31af952773d234d6f64993f2702766b5c65db87d0c4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.233/trebi_0.2.233_linux_arm64.tar.gz"
      sha256 "d9172f94190da67abd3a3cd172188472f2013644f4484fcfdc5d74abae1a2fe3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.233/trebi_0.2.233_linux_amd64.tar.gz"
      sha256 "84cec43f6a6fb7686630505be682a6d6b3b06d68eefb62cb92740dbfc16e4fbe"
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
