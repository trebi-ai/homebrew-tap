class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.129"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.129/trebi_0.2.129_darwin_arm64.tar.gz"
      sha256 "294abd7850ce2753b5fc930f33a039035a77bd2ab3b3bd5aba794ef776faa722"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.129/trebi_0.2.129_darwin_amd64.tar.gz"
      sha256 "d07abc78332647c9be8db8f9273811bb48189e024adc8ce4e5f15cacab47f9a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.129/trebi_0.2.129_linux_arm64.tar.gz"
      sha256 "a073f19dcb31719345843afd7e641846104077c1b6dc5539528fb0f18dd2905d"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.129/trebi_0.2.129_linux_amd64.tar.gz"
      sha256 "d74dc1fa8abcbea93f8ae8bed5faa903e9bb2b93faeb446b1322967ffceeb09d"
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
