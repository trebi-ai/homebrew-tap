class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.35/trebi_0.2.35_darwin_arm64.tar.gz"
      sha256 "175cc1111e70864acaea5488ec1b3563a148017b16fc907ab5e4f09e7cf2a1f0"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.35/trebi_0.2.35_darwin_amd64.tar.gz"
      sha256 "9b559003c65e2034fbf066e9d4923cd94ef762955aff84b58ba3ff0609562191"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.35/trebi_0.2.35_linux_arm64.tar.gz"
      sha256 "b570fc04adb1377b0a6da07070de6767041ed0dfc569419871cebab0ac2ec626"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.35/trebi_0.2.35_linux_amd64.tar.gz"
      sha256 "791a96e6bea761f516e8161f91a4dd810c837bfebb2842faffeda053f336a498"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
