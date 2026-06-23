cask "qx" do
  version "0.3.1"
  sha256 arm: "1ec24f9283cc7123c392774a49221c25409b5bf8cfe4b485a22b1c8283df2898"

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
  depends_on macos: ">= :sonoma"

  app "qx.app", target: "Qx.app"

  uninstall quit: "com.mcx.qx",
            delete: "/Applications/Qx.app"

  zap trash: [
    "~/Library/Application Support/qx",
    "~/.qx",
    "~/Library/Preferences/com.mcx.qx.plist",
  ]
end
