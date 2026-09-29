class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.32/trebi_0.2.32_darwin_arm64.tar.gz"
      sha256 "a5bbee1097f9d9549cef952a4eb79639240b5279501e6cb3c302f545d19bfa7b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.32/trebi_0.2.32_darwin_amd64.tar.gz"
      sha256 "5ff07afea43ba959bdc4d51aa8239dd2073cb1c221ae416e477ee43388ba152e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.32/trebi_0.2.32_linux_arm64.tar.gz"
      sha256 "8375408f152b11414d7d3fb84b2cf40da8334b4219a5378464ceea74e954e149"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.32/trebi_0.2.32_linux_amd64.tar.gz"
      sha256 "cae61e75c66b96a3d2427bfc0a2a957f89e9374c91e6d5991eb303a434c41cbe"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
