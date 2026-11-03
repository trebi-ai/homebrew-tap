class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.182"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.182/trebi_0.2.182_darwin_arm64.tar.gz"
      sha256 "fdc856b3c406d9542d29e57cf7c43f74ba189c0f463ef35eeae7fafd9d003629"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.182/trebi_0.2.182_darwin_amd64.tar.gz"
      sha256 "ad9430d919a9dbb5c0fde06f09d4683725e5663917c2a4e89366eb4734bf35c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.182/trebi_0.2.182_linux_arm64.tar.gz"
      sha256 "16654462b213a35a9a36a6c826723af5caebb9ff02db3a63c53fead2f5c82787"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.182/trebi_0.2.182_linux_amd64.tar.gz"
      sha256 "f6de06772d7d7bec74ab5ab1285359623e4e32c4660e2bdc71613d276da8e843"
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
