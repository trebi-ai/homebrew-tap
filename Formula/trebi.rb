class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.100"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.100/trebi_0.2.100_darwin_arm64.tar.gz"
      sha256 "3c6ab4b02fa5fb841e430a1ef67269089a44d5ba5d743e306f98a42dbeafd383"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.100/trebi_0.2.100_darwin_amd64.tar.gz"
      sha256 "36833f35b9db90a5d16daf2a272093287b855e0155530c18db522d4337e20034"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.100/trebi_0.2.100_linux_arm64.tar.gz"
      sha256 "35497e432611c8ce4c946627acabd3ea16c17098de94db5120792069d0ae8c40"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.100/trebi_0.2.100_linux_amd64.tar.gz"
      sha256 "f41599b4e5f399bd172225b2ad149dea14763cb08c8ef2ce90774fdf7356e2b9"
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
