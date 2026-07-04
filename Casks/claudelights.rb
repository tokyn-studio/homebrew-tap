# Homebrew cask for ClaudeLights.
#
# Lives in the tap repository (github.com/tokyn-studio/homebrew-tap) at
# Casks/claudelights.rb; this copy is the source of truth. scripts/release.sh
# prints a filled-in stanza (version + sha256) after every notarized build —
# paste that into the tap and push.
#
# Install:  brew install --cask tokyn-studio/tap/claudelights

cask "claudelights" do
  version "1.4"
  sha256 "496a06eb1807d422a83f7c4ba17e33dd8df91268049d7dd32ae8b7e76573f88f"

  url "https://github.com/tokyn-studio/claude-lights/releases/download/v#{version}/ClaudeLights.dmg"
  name "ClaudeLights"
  desc "Menu bar traffic light for Claude Code sessions"
  homepage "https://github.com/tokyn-studio/claude-lights"

  auto_updates true # Sparkle
  depends_on macos: ">= :ventura"

  app "ClaudeLights.app"

  zap trash: [
    "~/.claude/claudelights-status.json",
    "~/Library/Application Support/ClaudeLights",
    "~/Library/Caches/studio.tokyn.claudelights",
    "~/Library/Preferences/studio.tokyn.claudelights.plist",
  ]

  caveats <<~EOS
    Open ClaudeLights once and click "Install Hooks" to connect it to
    Claude Code (it adds hook entries to ~/.claude/settings.json; a backup
    is kept). Restart any running Claude Code sessions afterwards.

    Before uninstalling for good, click "Uninstall…" under Settings →
    Claude Code Hooks to remove those entries. If you forget, the leftover
    hooks are harmless no-ops (each entry checks that the helper binary
    still exists), but they stay in settings.json until removed manually.
  EOS
end
