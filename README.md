# posthog-flutter — fork Palima (`v5.53.0-palima.1`)

Fork of [PostHog/posthog-flutter](https://github.com/PostHog/posthog-flutter) **5.53.0** (MIT) with one change for session replay:
**native platform views (e.g. Mapbox maps, Metal-rendered) are shown in replays instead of a black rectangle.**

- iOS: a revealed platform view (`maskAllPlatformViews = false` or `PostHogPlatformView(privacy: capture)`) that is not a
  `WKWebView` is captured with `drawHierarchy` on its own `FlutterTouchInterceptingView` only (never the whole window).
  Refused when several platform views overlap the rect; uniform (all black / all white) captures are refused and the last
  good capture of the same rect is reused, else a neutral grey is painted. At most one `drawHierarchy` per view every 2 s.
- Dart: the frame is re-composited in paint order — Flutter layers below the view, the native capture, then the Flutter
  layers above it (bottom sheets, buttons stay visible) — and the masks last. Masked views keep an opaque mask.
- Debug only: `PostHogReplayDebug.onComposedFrame` (each composed PNG) and `PostHogReplayDebug.offline` (nothing sent).

Context: issue [#593](https://github.com/PostHog/posthog-flutter/issues/593), draft PR [#616](https://github.com/PostHog/posthog-flutter/pull/616).
Usage: `dependency_overrides: posthog_flutter: git: {url: https://github.com/Smartripsfr/posthog-flutter, ref: <sha>, path: posthog_flutter}`.

---

[![Package on pub.dev][pubdev_badge]][pubdev_link]

# PostHog Flutter

Please see the main [PostHog docs](https://posthog.com/docs).

Specifically, the [Flutter docs](https://posthog.com/docs/libraries/flutter) details.

## Questions?

### [Check out our community page.](https://posthog.com/posts)

[pubdev_badge]: https://img.shields.io/pub/v/posthog_flutter
[pubdev_link]: https://pub.dev/packages/posthog_flutter
