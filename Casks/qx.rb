cask "qx" do
  version "0.4.0"
  sha256 arm: "c17bf2dd8fc608a2b12c42e3cac992b2f389d829b63a844b941048e0156c2ffe"

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
