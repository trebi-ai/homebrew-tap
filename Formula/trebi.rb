class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.152"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.152/trebi_0.2.152_darwin_arm64.tar.gz"
      sha256 "bfc7753f3b11be0a3361f55e7d932918bf30a73c863efc4aa1a176a29bcf78fe"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.152/trebi_0.2.152_darwin_amd64.tar.gz"
      sha256 "d9b4f927f621e18e0cb4af950b5084e3ba79913bbd84105bddc7384b56f60a50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.152/trebi_0.2.152_linux_arm64.tar.gz"
      sha256 "fcad0896792bca26a9e1804b62db78abb0aa1fd3dd5f01fd8b1605566038afb0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.152/trebi_0.2.152_linux_amd64.tar.gz"
      sha256 "c010e130c780918f371691a41737a449399ed7cee4cb5f8cc5a6a64d958b0ec3"
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
