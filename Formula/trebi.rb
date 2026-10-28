class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.164"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.164/trebi_0.2.164_darwin_arm64.tar.gz"
      sha256 "6c4cf52b9a9014c8a07feeb0bdb4dbb6bba7dcd9fd222d663a885f8412fa8e68"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.164/trebi_0.2.164_darwin_amd64.tar.gz"
      sha256 "46f3edd63e4f8e6efcabaefa013e3b1d7ee819cc11322c4fa4b7e47bd75a20d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.164/trebi_0.2.164_linux_arm64.tar.gz"
      sha256 "544ed86b398ae8de9e685a8f056f1ece37fd4dbc55a5d11027a0dd0aca3c8683"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.164/trebi_0.2.164_linux_amd64.tar.gz"
      sha256 "e73f6f6ae0488ddbe7e06ef760785af7ac7443802f3c5f1ca4ff1f4b90b5b15d"
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
