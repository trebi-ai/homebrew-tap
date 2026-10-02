class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.43/trebi_0.2.43_darwin_arm64.tar.gz"
      sha256 "edb82d530c7cc7289e4d4ef01edaff44ea7d206b94bfba36d473fb6b0e5ad061"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.43/trebi_0.2.43_darwin_amd64.tar.gz"
      sha256 "6ddf69e54ed3437c72dd83925c36d92e833f4a659db00d8f7e5b221ae52f6124"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.43/trebi_0.2.43_linux_arm64.tar.gz"
      sha256 "ea66a169e266f308ee989d190a352b18e3d755e231c96daa6f45959b88d8ecbc"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.43/trebi_0.2.43_linux_amd64.tar.gz"
      sha256 "7da41af8ec1858bc86933956667ab7a262192013439898c8d197d0cba042a054"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
