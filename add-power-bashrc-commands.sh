#!/usr/bin/env bash
#
# Appends contents of power-bashrc to ~/.bashrc (if not already included)
# Usage: ./install-power-bashrc.sh
#

POWER_BASHRC="power-bashrc"
BASHRC="~/.bashrc"
TAG_START="# >>> power-bashrc start >>>"
TAG_END="# <<< power-bashrc end <<<"

# Check that the source file exists
if [ ! -f "$POWER_BASHRC" ]; then
  echo "❌ Error: $POWER_BASHRC not found."
  exit 1
fi

# Check if it's already included
if grep -q "$TAG_START" "$BASHRC"; then
  echo "⚠️  power-bashrc already added to ~/.bashrc."
  exit 0
fi

# Backup existing bashrc
cp "$BASHRC" "${BASHRC}.bak_$(date +%Y%m%d_%H%M%S)"
echo "📦 Backup created: ${BASHRC}.bak_*"

# Append with clear markers
{
  echo ""
  echo "$TAG_START"
  echo "# Added on $(date)"
  cat "$POWER_BASHRC"
  echo "$TAG_END"
  echo ""
} >> "$BASHRC"

echo "✅ power-bashrc appended to ~/.bashrc"
echo "🔁 Reload your bashrc with:"
echo "    source ~/.bashrc"
