cask "qx" do
  version "0.4.2"
  sha256 arm: "6495eed7ff3e4bc6d3c5ed1c35d9aeb7113c798339d4272aec8c55fafddd08be"

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
