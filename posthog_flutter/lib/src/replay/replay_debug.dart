import 'dart:typed_data';

/// Palima patch (replay_carte_1210): debug hooks for session replay.
///
/// Not meant for production: lets the app receive every composed replay frame
/// (PNG) before it is handed to the native SDK, and run the capture loop without
/// a native replay session (nothing is sent in [offline] mode).
class PostHogReplayDebug {
  PostHogReplayDebug._();

  /// Called with each composed frame (PNG bytes) and a short timing summary.
  static void Function(Uint8List png, String info)? onComposedFrame;

  /// When true, the capturer runs even if the native replay session is not
  /// active, and frames are never sent to the native SDK.
  static bool offline = false;
}
