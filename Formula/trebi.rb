class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.139"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.139/trebi_0.2.139_darwin_arm64.tar.gz"
      sha256 "88b1bed28b5d002a642ebeceef835355d4ca43f33f0fe292add22f547aad4718"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.139/trebi_0.2.139_darwin_amd64.tar.gz"
      sha256 "a361972072eee4825b85f4226b01a064c2fc425f76b7f1df7c53081bfe13ffe5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.139/trebi_0.2.139_linux_arm64.tar.gz"
      sha256 "2c1c39ac57341fde2c4ea007b3f9a78e3d9e7eb01dedc03d1906cb493749422e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.139/trebi_0.2.139_linux_amd64.tar.gz"
      sha256 "0ace601c6d1e69b27b3ab162c50bbc885f16b564d10e9f6f7713ccf1fbc8b8ee"
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
