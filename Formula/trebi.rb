class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.21/trebi_0.2.21_darwin_arm64.tar.gz"
      sha256 "17a9583eadcdbbc6693011aa95f0b6dd1cd5e1c37ad500a72bc500b32b6e8817"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.21/trebi_0.2.21_darwin_amd64.tar.gz"
      sha256 "47efe1517273f38de2cc3cc3ae9a7f2b54aff62683a17bdac5c664d7dae51d2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.21/trebi_0.2.21_linux_arm64.tar.gz"
      sha256 "76b78a2ecaf2bacf5b23f4609f562a76bf9926628e006a15e5350198c8d2a92e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.21/trebi_0.2.21_linux_amd64.tar.gz"
      sha256 "f4a2ac65bcb623f5473c3b3b1fe160788cbbe334490efadc1a477b10bbf5b021"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
