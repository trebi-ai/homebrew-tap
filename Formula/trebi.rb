class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.188"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.188/trebi_0.2.188_darwin_arm64.tar.gz"
      sha256 "36a2798bf7e059c8ea91d93bfb9993aa24d58d38401ff5856f44d87c0c3810f5"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.188/trebi_0.2.188_darwin_amd64.tar.gz"
      sha256 "ed929eae2e6078f0717c52611947ad44b882aeae207f34f5bdb70701cff63991"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.188/trebi_0.2.188_linux_arm64.tar.gz"
      sha256 "cdc0dc811afae2fa431c47258ba52dfe607b58cf076005446fe01b48623f6ea9"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.188/trebi_0.2.188_linux_amd64.tar.gz"
      sha256 "596c2202e2f93acf82703fcdc2274da526f5f1a3cf8541ea1bd5ccad606cd539"
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
