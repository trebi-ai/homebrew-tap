class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.137"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.137/trebi_0.2.137_darwin_arm64.tar.gz"
      sha256 "3670393fc360def34868ee895f00f02ebce1cac815157d3f18bdbf6847f2e7a4"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.137/trebi_0.2.137_darwin_amd64.tar.gz"
      sha256 "89bf509424db8d2690b2b647b6195aa30d27259e0c8d427be20df7db9a018be4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.137/trebi_0.2.137_linux_arm64.tar.gz"
      sha256 "a9ab649070f1c253de223f8341d2e563c2e4f67562870a4c23e5f6b8cbfda5e8"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.137/trebi_0.2.137_linux_amd64.tar.gz"
      sha256 "e8f6fe797e6acba84596bdff008c1fdb7900df501a1343999df6acfbd8bd38ec"
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
