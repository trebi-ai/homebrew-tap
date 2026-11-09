class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.199"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.199/trebi_0.2.199_darwin_arm64.tar.gz"
      sha256 "8930ac94639784ee89380fcb60a3f3616aa5486b2ecd133f1c5cd293f10225d0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.199/trebi_0.2.199_darwin_amd64.tar.gz"
      sha256 "940b9739e89f9159b2189ce94d1392d2d19054ecbe7743e99eb8a15c0d578abe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.199/trebi_0.2.199_linux_arm64.tar.gz"
      sha256 "120f7acb5715b8a64cafe52476073e532767d733a3a1aa49b02e460822ce4350"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.199/trebi_0.2.199_linux_amd64.tar.gz"
      sha256 "e2becc263be0074f189d44331384f1c0f3ca6f56240c2c68ec71aca346189b13"
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
