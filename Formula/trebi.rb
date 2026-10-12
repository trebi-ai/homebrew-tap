class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.105"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.105/trebi_0.2.105_darwin_arm64.tar.gz"
      sha256 "52542ca835709f2a845b3f14b50dc816810f183f4297c388fc16adf78b66618e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.105/trebi_0.2.105_darwin_amd64.tar.gz"
      sha256 "1e3d25feaf9522156462259c854c2ac7b6b0b9ad9007351aa9c44a6c1ca18cbc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.105/trebi_0.2.105_linux_arm64.tar.gz"
      sha256 "58bb5ccb51c0c3340b9404c66e7e3f1f7d8d3c3da6af2e1622b2595df1684b32"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.105/trebi_0.2.105_linux_amd64.tar.gz"
      sha256 "8e266081cfe88357a1c3241a1ae7b719722e265984f0ff442ceca4dbb47e39b7"
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
