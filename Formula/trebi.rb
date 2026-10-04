class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.48/trebi_0.2.48_darwin_arm64.tar.gz"
      sha256 "400ab35d767fa4548663e34e64a476f890b59110ddd3361dc1ce42afd98cc595"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.48/trebi_0.2.48_darwin_amd64.tar.gz"
      sha256 "f5ebf274c241281525365d5a6c0301e14d54667de9e4682c17fb97773e300c6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.48/trebi_0.2.48_linux_arm64.tar.gz"
      sha256 "79a5b9ef9cc511fd60267b598c01c530d6df4b4b2edfaa0263def81939818944"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.48/trebi_0.2.48_linux_amd64.tar.gz"
      sha256 "4df6b4edd998c316c082bdb9f1218b36ec52829ec65faadd78e7a7c99665dee6"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
