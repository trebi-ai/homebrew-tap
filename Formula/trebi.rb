class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.102"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.102/trebi_0.2.102_darwin_arm64.tar.gz"
      sha256 "521bb1cfa840fe1bb05445c323b805ffd4d6df262fc7289e1279df592055b75b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.102/trebi_0.2.102_darwin_amd64.tar.gz"
      sha256 "8e77606068932cff5fa874eee2bc3730d4bbf078e25d0e75eb903e60f844538a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.102/trebi_0.2.102_linux_arm64.tar.gz"
      sha256 "1094d4e1fefeb1dca252479a067ea44420fb94a0066d1fd85779da8ea0471f48"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.102/trebi_0.2.102_linux_amd64.tar.gz"
      sha256 "10fc2e0e90f76070e7e3d9f21cc6fd876ec2ce042de9f6c5244b130cefeaee82"
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
