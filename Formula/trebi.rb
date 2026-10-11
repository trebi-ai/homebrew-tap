class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.95"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.95/trebi_0.2.95_darwin_arm64.tar.gz"
      sha256 "7dbf3416994bd10b9ce65d3d7e9833d5efa7667638c4ba43a00851b141472658"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.95/trebi_0.2.95_darwin_amd64.tar.gz"
      sha256 "7762927317937f1c195e28b00e0ecc3111edaf923b2dd5d7dc1fc3e5a506b4a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.95/trebi_0.2.95_linux_arm64.tar.gz"
      sha256 "8a10e24d883612d3b60c8d82eb5f488ce2f25287e6be410a091f8f03eb7a4039"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.95/trebi_0.2.95_linux_amd64.tar.gz"
      sha256 "26bc04140f11bad98cb332961d71be538c837f8d4a0dab8b0e81ba4936f856a4"
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
