require "download_strategy"

# The release is on a private repository. Homebrew gets the asset
# through the GitHub API with HOMEBREW_GITHUB_API_TOKEN.
class PerceptionAssetDownloadStrategy < CurlDownloadStrategy
  private

  def _fetch(url:, resolved_url:, timeout:)
    token = Homebrew::EnvConfig.github_api_token.presence || ENV["HOMEBREW_GITHUB_API_TOKEN"]
    raise CurlDownloadStrategyError.new(url, "set HOMEBREW_GITHUB_API_TOKEN (gh auth token) to install perception") if token.blank?

    curl_download url, "--header", "Accept: application/octet-stream",
                  "--header", "Authorization: Bearer #{token}",
                  to: temporary_path, timeout: timeout
  end
end

class Perception < Formula
  desc "Work space for agents: collect, store, index, route, serve"
  homepage "https://github.com/trebi-ai/perception"
  version "0.5.3"
  url "https://api.github.com/repos/trebi-ai/perception/releases/assets/645095019",
      using: PerceptionAssetDownloadStrategy
  sha256 "c6418499febe2d30287acf01bf1873862648a7bf9c27c9ab89b0feff31ed449a"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "ffmpeg"

  def install
    bin.install "perception", "PerceptionHelper.app.zip"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/perception --version")
  end
end
