cask "qx" do
  version "0.4.7"
  sha256 arm: "78b5f10f9170e116803746c5debe2aff263847fc1e5e8d1e6fa4b8579f83378f"

  url "https://github.com/mcxen/qx/releases/download/v#{version}/qx_v#{version}_aarch64-apple-darwin.app.zip"
  name "Qx"
  desc "A keyboard-driven productivity launcher for macOS"
  homepage "https://github.com/mcxen/qx"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "qx.app", target: "Qx.app"

  uninstall quit: "com.mcx.qx",
            delete: "/Applications/Qx.app"

  zap trash: [
    "~/Library/Application Support/qx",
    "~/.qx",
    "~/Library/Preferences/com.mcx.qx.plist",
  ]
end
