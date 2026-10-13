class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.115"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.115/trebi_0.2.115_darwin_arm64.tar.gz"
      sha256 "ecb4f22fadad8db2dce14dbd1214b71cd4650e998b4dffc4e6909f11c98f9511"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.115/trebi_0.2.115_darwin_amd64.tar.gz"
      sha256 "8662e3b936e7585dd83cf32558666bcbb6fde3beb95f389639899381a897c330"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.115/trebi_0.2.115_linux_arm64.tar.gz"
      sha256 "f751831a3fef4f980dd92a9b50267c9743b2c474154cf7dd0612df1504e62801"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.115/trebi_0.2.115_linux_amd64.tar.gz"
      sha256 "166aa4651a8cdb55348a2a17c33bd3b65f17e30cf12e0bd10b22224dec98e0f5"
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
