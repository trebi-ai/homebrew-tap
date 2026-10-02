class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.47/trebi_0.2.47_darwin_arm64.tar.gz"
      sha256 "3d7322046af106a5d92303f594c31010d183b0117fc97fa00101c7b65cafa146"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.47/trebi_0.2.47_darwin_amd64.tar.gz"
      sha256 "5a1167702598d4d963579c117e594c72bc688e6e41c55409ffa63cb45c090060"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.47/trebi_0.2.47_linux_arm64.tar.gz"
      sha256 "509685d5fb4419d9c237aa4388b3bda93bafcd8a78af8db5604c24cbcd103f6b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.47/trebi_0.2.47_linux_amd64.tar.gz"
      sha256 "7c80c036151bee40ff29880b0b1ea16d903c3886fcd4e52d7b5be0fa8adcbac4"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
