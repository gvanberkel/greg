# Project notes for Claude Code

Flutter web app (Greg van Berkel's CV). Content lives as markdown in
`assets/cv_content/<version>/` (e.g. `g21`, `g26`) and is rendered by the
screens under `lib/screens/`.

## Building the web app

Always build with WebAssembly enabled:

```bash
flutter build web --wasm --release
```

- The `--wasm` flag is required for all web builds in this project.
- Output goes to `build/web/`. A JS fallback (`main.dart.js`) is emitted
  alongside the WASM artifacts (`main.dart.wasm`, `main.dart.mjs`) so browsers
  without WasmGC support still work.

## Publishing / deploying

The live site (https://gvanberkel.github.io/) is served from a **separate**
repository, `gvanberkel/gvanberkel.github.io`, which holds the raw
`flutter build web` output at its root on the `main` branch. This source repo
(`gvanberkel/greg`) is not itself served by GitHub Pages.

To publish:

1. Build with `flutter build web --wasm --release`.
2. Clone `gvanberkel/gvanberkel.github.io`.
3. Replace its contents (everything except `.git`) with `build/web/`.
4. Commit and push to `main`. GitHub Pages redeploys automatically.

Notes:
- The published `index.html` uses `<base href="/">` (served from the site root).
- After deploying, hard-refresh (Ctrl+F5) to bypass the service-worker cache.
