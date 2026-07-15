cask "qx" do
  version "0.5.19"
  sha256 arm: "a02b98a260ef99641519f314602ce7eec56a5f3d2e23943ac08f61436f5f0c99"

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
