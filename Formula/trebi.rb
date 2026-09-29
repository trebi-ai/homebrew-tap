class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.34/trebi_0.2.34_darwin_arm64.tar.gz"
      sha256 "7f0196c65dc8c6fe620812b3d781241c0c6c6b96f7726f9a547e8a7d200b9b64"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.34/trebi_0.2.34_darwin_amd64.tar.gz"
      sha256 "c63f1dd5b53e887b849c16523f579d9a1e79ffc7d182b5fb313c593a4c674d79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.34/trebi_0.2.34_linux_arm64.tar.gz"
      sha256 "cd52d34a5c06f3e7ca567ac903276e04f5d2a342a44b41ec32e0a4d9625a5e48"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.34/trebi_0.2.34_linux_amd64.tar.gz"
      sha256 "b4193af49e539979c136525678ba38258228f2e2785dd1c637928a89e5ad0eec"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
