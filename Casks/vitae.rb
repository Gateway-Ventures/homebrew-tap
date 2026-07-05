# Source-of-truth cask. The desktop release workflow patches `version` + `sha256`
# from the built artifact and publishes it to Gateway-Ventures/homebrew-tap.
# Install: brew install --cask Gateway-Ventures/tap/vitae
cask "vitae" do
  version "0.1.0"
  sha256 "29960b8d3417c0a7957f34c9c7d441644ffe884be553414f86ab1f65d7f93df4"

  url "https://storage.googleapis.com/vitae-releases/desktop/v#{version}/Vitae-#{version}-arm64.dmg",
      verified: "storage.googleapis.com/vitae-releases/"
  name "Vitae"
  desc "Recruiting workspace with native notifications, badge, and deep links"
  homepage "https://vitae.ai/"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Vitae.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Vitae.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Vitae",
    "~/Library/Caches/ai.vitae.desktop",
    "~/Library/HTTPStorages/ai.vitae.desktop",
    "~/Library/Preferences/ai.vitae.desktop.plist",
    "~/Library/Saved Application State/ai.vitae.desktop.savedState",
  ]
end
