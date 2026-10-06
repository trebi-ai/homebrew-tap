class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.60/trebi_0.2.60_darwin_arm64.tar.gz"
      sha256 "fc4805ee89669bc78d0775658577c12816985ec9840ce88c6320aa415cda03ee"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.60/trebi_0.2.60_darwin_amd64.tar.gz"
      sha256 "c1931e8c79ef0013a3051caef8175d062261d9f64c6fbae93e528302fdbff698"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.60/trebi_0.2.60_linux_arm64.tar.gz"
      sha256 "b1264454fbfe08e24996164431b90584b45386957260d5ba33e75c44413caf12"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.60/trebi_0.2.60_linux_amd64.tar.gz"
      sha256 "8c607986133a8172f61c80f21731f5960a792c19761818753be0e7f9607183e6"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
