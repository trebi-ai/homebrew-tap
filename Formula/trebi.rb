class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.12/trebi_0.2.12_darwin_arm64.tar.gz"
      sha256 "107ccde3c972439d8181dd48cbf747f1a6e448c163900b8ab96794f21734d8bd"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.12/trebi_0.2.12_darwin_amd64.tar.gz"
      sha256 "abbba0e1b4fd30c0829cbd1150feeda51943b8fd009d1fd9ed6c10b2aead4181"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.12/trebi_0.2.12_linux_arm64.tar.gz"
      sha256 "35db909b45cbe65b8c822533f62f908001c372b58f2c096d2c527c92f5d917b3"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.12/trebi_0.2.12_linux_amd64.tar.gz"
      sha256 "efa7652a4fbe7192bba976fb344350f4fa16b79e8b9587a61bed852f2600c66f"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
