cask "mernyx" do
  version "1.0.0"
  sha256 "30826f6362b6cacd94e7d731b9c8c3ba8a8c2a6b1aadca5b71d0a61c2727faf8"

  url "https://releases.mernyx.com/Mernyx-#{version}.dmg"
  name "Mernyx"
  desc "Native Mermaid editor for diagramming"
  homepage "https://mernyx.com"

  livecheck do
    url "https://mernyx.com/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= 14.0"

  app "Mernyx.app"

  caveats <<~EOS
    This installs the standalone (direct) build, which uses a licence key
    instead of the Mac App Store receipt.

    Mernyx uses the same bundle identifier as the App Store edition, so only
    one copy can be installed at a time — installing one replaces the other.
    Store purchases do not carry over to this build, and App Store receipts
    are not read by it.
  EOS

  uninstall quit: "com.mernyx.app"

  zap trash: [
    "~/Library/Containers/com.mernyx.app",
    "~/Library/Preferences/com.mernyx.app.plist",
    "~/Library/Saved Application State/com.mernyx.app.savedState",
    "~/Library/Caches/com.mernyx.app",
  ]
end
