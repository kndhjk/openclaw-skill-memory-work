#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
FAKE_NDK_DIR="$ROOT_DIR/.termux-android-ndk"
CPUFEATURES_DIR="$FAKE_NDK_DIR/sources/android/cpufeatures"

mkdir -p "$CPUFEATURES_DIR"
cat > "$CPUFEATURES_DIR/README.md" <<'EOF'
Placeholder path for node-gyp on Termux/Android.
Some Android Node headers expect android_ndk_path to exist.
EOF

cd "$ROOT_DIR"
rm -rf node_modules package-lock.json
npm_config_android_ndk_path="$FAKE_NDK_DIR" npm install "$@"

echo
echo "✅ openclaw-memory installed successfully on Termux"
echo "   Fake NDK path: $FAKE_NDK_DIR"
echo "   Next step: npm run setup"
