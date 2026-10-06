class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.64/trebi_0.2.64_darwin_arm64.tar.gz"
      sha256 "1334edd1d796235c0e6e6b7880357a79c91533389f449ab41aafcb492553e1d3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.64/trebi_0.2.64_darwin_amd64.tar.gz"
      sha256 "a86da4213869a95c9256c97306ab8951b0119faa3ab3f47a03f4850a01149e27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.64/trebi_0.2.64_linux_arm64.tar.gz"
      sha256 "4f498c3c8443d0f5bb5edb1063694c1b310b0fa9869318b50df60b75581e8f12"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.64/trebi_0.2.64_linux_amd64.tar.gz"
      sha256 "325df55b90cc315f5c21bb5e41876da6cb98f07e30224cffed23eb9b2edef798"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
