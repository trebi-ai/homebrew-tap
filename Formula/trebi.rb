class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.153"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.153/trebi_0.2.153_darwin_arm64.tar.gz"
      sha256 "e5143b040059c85b627312f7f0714ccf87f0b1b84debcc4cdf922eab5ff91c6f"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.153/trebi_0.2.153_darwin_amd64.tar.gz"
      sha256 "fb70b6945d65523e2fe941cd846aa2b7a39fc0b75e658cb53e41617baf611223"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.153/trebi_0.2.153_linux_arm64.tar.gz"
      sha256 "de772ca5af9695d9070f12e26764cd44c38df2e39e710823d18b13403287f44e"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.153/trebi_0.2.153_linux_amd64.tar.gz"
      sha256 "8f0d9709fd54d15a2c7849f792e508f426a6d876fd3b152345ce5819565c09d1"
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
