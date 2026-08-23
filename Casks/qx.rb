cask "qx" do
  version "0.6.100"
  sha256 arm: "c6d40a437b41568a341b5e81b6e485fdb762c433b70fe9fd14d6eeec4341c51c"

  url "https://github.com/mcxen/qx/releases/download/v#{version}/qx_v#{version}_aarch64-apple-darwin.app.zip"
  name "Qx"
  desc "A keyboard-driven productivity launcher for macOS"
  homepage "https://github.com/mcxen/qx"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Qx.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Qx.app"],
                   sudo: false
  end

  uninstall quit: "com.mcx.qx"

  zap trash: [
    "~/Library/Application Support/qx",
    "~/.qx",
    "~/Library/Preferences/com.mcx.qx.plist",
  ]
end
