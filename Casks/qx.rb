cask "qx" do
  version "0.4.6"
  sha256 arm: "282f0d96ffe03ece08609ec70ec6fce0e64791b9dcf4fb19217b9b4e229f13fa"

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
