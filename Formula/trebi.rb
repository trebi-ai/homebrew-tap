class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.28/trebi_0.2.28_darwin_arm64.tar.gz"
      sha256 "79e03ff63cebf43562099b12fad764c060f16fc5d7c7c72ef14a4fe09813b7a7"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.28/trebi_0.2.28_darwin_amd64.tar.gz"
      sha256 "ff6565496d08ea4642601dfffc796602b3ddd716bb6801f350d9e3b76a5c15ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.28/trebi_0.2.28_linux_arm64.tar.gz"
      sha256 "af46e7d6eae0ea3e919b44609fcff4ec8cfec57ae3ae873a192f8ed158d90a60"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.28/trebi_0.2.28_linux_amd64.tar.gz"
      sha256 "bbae790afc191a27ecc596eb9cc40e1833c525da5e00f165295c046aae7e4764"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
