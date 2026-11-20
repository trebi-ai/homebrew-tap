class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.228"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.228/trebi_0.2.228_darwin_arm64.tar.gz"
      sha256 "c65e7b7f7474cf2d1453918702e07f9324fae60bfa0bf17afaa9b189bccd059b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.228/trebi_0.2.228_darwin_amd64.tar.gz"
      sha256 "2715b8e79ba7b36bfcc3b60e32ae35fc8894571606823706f56a2623b33dd373"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.228/trebi_0.2.228_linux_arm64.tar.gz"
      sha256 "ed0597386137aa3d3b4f4494ed040da1c0fbf00979a016a945cfa6afc5917dbe"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.228/trebi_0.2.228_linux_amd64.tar.gz"
      sha256 "37d4fb66a2c0129ec4a8f3cec47142585e07cb49857b48d4ecf131f7e556e28f"
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
