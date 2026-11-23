class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.242"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.242/trebi_0.2.242_darwin_arm64.tar.gz"
      sha256 "6b84a9cec0a81b79c8b4784b8bdd2a61cfbb244fdb3aeee630a41ecb76deed1b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.242/trebi_0.2.242_darwin_amd64.tar.gz"
      sha256 "cb6ad455ae84196e41dbc9f66ccac726db7a710de87e44504650e6dad004082c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.242/trebi_0.2.242_linux_arm64.tar.gz"
      sha256 "6e9a83fab14e324b962410d41d431bb22493cc91130148dc3d32a6915e71cac1"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.242/trebi_0.2.242_linux_amd64.tar.gz"
      sha256 "b4427af9d6b64445b8bd75c16388f89e90e0e5a6951c9034aad81d96e51d9274"
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
