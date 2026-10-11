class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.93"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.93/trebi_0.2.93_darwin_arm64.tar.gz"
      sha256 "d6222e804775a04897e5ffaf829493bf80e755496201cf196eb704818d27e04c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.93/trebi_0.2.93_darwin_amd64.tar.gz"
      sha256 "132022bb1c5d77b7305ca8e6d683e8addb708c0e8a8e950e324a73d3ad53a9d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.93/trebi_0.2.93_linux_arm64.tar.gz"
      sha256 "f00f76c979ac9e6a18a99b8323b673396ebb04b3d8c46ac9736e6579b7255716"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.93/trebi_0.2.93_linux_amd64.tar.gz"
      sha256 "c7843ced72627b12e2cf7849d07edd0235c337a74539780b0a7dc2ebd34557ac"
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
