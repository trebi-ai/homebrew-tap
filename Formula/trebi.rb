class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.88"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.88/trebi_0.2.88_darwin_arm64.tar.gz"
      sha256 "dd28b41319e1b3bbd035216fc5d1d4b5402abe7153db08df20afa41b3a97df09"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.88/trebi_0.2.88_darwin_amd64.tar.gz"
      sha256 "a63b8dd7a4e96714d1db6e76ac4beec16c73654132664cb2622910a18a2b7027"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.88/trebi_0.2.88_linux_arm64.tar.gz"
      sha256 "68756bc84b255e022c023995fd490074ce1d854709a3378eb7cf10741d48e17c"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.88/trebi_0.2.88_linux_amd64.tar.gz"
      sha256 "1dcf6c91b724728ba47488e3c4a80724bad3d1b223194d27fa5102ee0840174a"
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
