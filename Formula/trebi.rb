class Trebi < Formula
  desc "LLM task runner"
  homepage "https://github.com/trebi-ai/trebi"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.8/trebi_0.2.8_darwin_arm64.tar.gz"
      sha256 "ccf51bb095a095c7e3d34a5aac93a6ce5fbbad6c89441ed8717e4a5cf77190bb"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.8/trebi_0.2.8_darwin_amd64.tar.gz"
      sha256 "ac0c7db32165183b5f71223c25e597c857e819746f8b014567e2f5795d07f4c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.8/trebi_0.2.8_linux_arm64.tar.gz"
      sha256 "f9837211f913d10037bdf4a75884d5ecf1c0a9dcacae69170d1c34bd54ff7464"
    else
      url "https://github.com/trebi-ai/trebi/releases/download/v0.2.8/trebi_0.2.8_linux_amd64.tar.gz"
      sha256 "4ab43514d700c49294c8bae3dbb33ed8d49b45862e97335c1b8d5864b19c2081"
    end
  end

  def install
    bin.install "trebi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trebi --version")
  end
end
