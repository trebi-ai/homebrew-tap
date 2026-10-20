class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.141"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.141/trebi_0.2.141_darwin_arm64.tar.gz"
      sha256 "7e7f9c5eff2492ea955daa1cf4cc9d8fcecacfaf3dd38079dfc6b2caea9bcf58"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.141/trebi_0.2.141_darwin_amd64.tar.gz"
      sha256 "7232df3c9d762962625f8303ce8c238c5888cc86753080fef9d3341420178244"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.141/trebi_0.2.141_linux_arm64.tar.gz"
      sha256 "a57ac10cf11e081ec628af06ea6abfa6d0ad6757ff05e45e44d4a42daa8744e1"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.141/trebi_0.2.141_linux_amd64.tar.gz"
      sha256 "fcafd3295fd71cbd8db1837d30b8198c52369b3baa3feef43deccca59a18426f"
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
