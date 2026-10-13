class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.116"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.116/trebi_0.2.116_darwin_arm64.tar.gz"
      sha256 "69d23406fafe49102ce3191a53f7bace7e7fe76dcf13295df11f37a2d3899bef"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.116/trebi_0.2.116_darwin_amd64.tar.gz"
      sha256 "e9985267b681b12a7deb76a093b2e3bc45cf318b8be020066567e5cb6fe96ae6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.116/trebi_0.2.116_linux_arm64.tar.gz"
      sha256 "f1c24585e822e780bc85297da422729f434f697278429d7494013c26a48ae45b"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.116/trebi_0.2.116_linux_amd64.tar.gz"
      sha256 "a50a1afe1d06a7ce3390c01d268eaffe09405c13c412df58077bad1208466da9"
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
