cask "veref" do
  version "0.1.0"

  sha256 "3da8df62402a517ef48167b8072d560ee6c902c55adff4993f492640dc53002e"

  url "https://storage.googleapis.com/veref-releases/desktop/v#{version}/Veref-#{version}-arm64.dmg",
      verified: "storage.googleapis.com/veref-releases/"
  name "Veref"
  desc "Verified hiring ops — reference checks, identity, and interview trust"
  homepage "https://veref.work"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

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
