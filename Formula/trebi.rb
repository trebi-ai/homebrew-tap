class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.196"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.196/trebi_0.2.196_darwin_arm64.tar.gz"
      sha256 "8e0daed6e0b36cadb59e243b4208653ac14e9a83156a2b94c1cb1ad649b18ba6"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.196/trebi_0.2.196_darwin_amd64.tar.gz"
      sha256 "84dab3f6ac5463afd29871ac24d34cb47628890f58b990ec3625797828ede4d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.196/trebi_0.2.196_linux_arm64.tar.gz"
      sha256 "683ddeff4b78fb118325b45a03a9e25659ff568a84120d001fd0665e41f3b2f9"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.196/trebi_0.2.196_linux_amd64.tar.gz"
      sha256 "6de5953be116492efc78be02800f962d535952f504329885312d475d005cccf7"
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
