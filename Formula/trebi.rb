class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.190"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.190/trebi_0.2.190_darwin_arm64.tar.gz"
      sha256 "08cdaa5ea2d8ef182f59793f5e87d9bd4eb10398dc9f0fe42cc8515bdc6c4d44"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.190/trebi_0.2.190_darwin_amd64.tar.gz"
      sha256 "ee6f83ac148346f3b18b9f8d51d12d5dc38246d9b42ddb01703f8d2dbafd9b89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.190/trebi_0.2.190_linux_arm64.tar.gz"
      sha256 "9d8e91f9313160464c654b73a88a9d821ed222cf328c52970dc066c58105747f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.190/trebi_0.2.190_linux_amd64.tar.gz"
      sha256 "291560a1fe9dafddac2837d35d5a00e3f5273b4d3e6826f9208b88f977eaeeab"
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
