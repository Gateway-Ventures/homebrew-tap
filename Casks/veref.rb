cask "veref" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/Gateway-Ventures/veref.work/releases/download/v#{version}/Veref-#{version}-#{arch}.dmg",
      verified: "github.com/Gateway-Ventures/veref.work/"
  name "Veref"
  desc "Verified hiring ops — reference checks, identity, and interview trust"
  homepage "https://veref.work"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Veref.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Veref.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Veref",
    "~/Library/Caches/work.veref.desktop",
    "~/Library/HTTPStorages/work.veref.desktop",
    "~/Library/Preferences/work.veref.desktop.plist",
    "~/Library/Saved Application State/work.veref.desktop.savedState",
  ]
end
