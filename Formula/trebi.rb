class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.235"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.235/trebi_0.2.235_darwin_arm64.tar.gz"
      sha256 "887e4346870a9718b423c7b4c93c260a231d297d2f3f168c2b15ecf4bc691a50"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.235/trebi_0.2.235_darwin_amd64.tar.gz"
      sha256 "3d915a4675d9cc3fb28a89cc8f3f919c18f0bd8d1914a9e8528938de0e284579"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.235/trebi_0.2.235_linux_arm64.tar.gz"
      sha256 "a279d4edeaee08fa1ee16a25c227652ea82d337ff1a285ee5ec30945159bf4de"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.235/trebi_0.2.235_linux_amd64.tar.gz"
      sha256 "dce37b4e550ac1b3fe44b8348f92386e721943a44eba65b44641782cee15d032"
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
