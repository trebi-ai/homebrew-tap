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
  desc "Work context for agents: collect, store, index, route, serve"
  homepage "https://github.com/trebi-ai/perception"
  version "0.2.4"
  url "https://api.github.com/repos/trebi-ai/perception/releases/assets/637761638",
      using: PerceptionAssetDownloadStrategy
  sha256 "d09dcf5bb5b4d2725b0275f46be980ee9126332394f07bbcd6eaa91aa269927d"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "ffmpeg"

  def install
    bin.install "perception"
    bin.install "perception-helper" if File.exist?("perception-helper")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/perception --version")
  end
end
